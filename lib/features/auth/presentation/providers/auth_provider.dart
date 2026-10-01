import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:facturacion_app/core/network/secure_storage_service.dart';
import 'package:facturacion_app/features/auth/data/models/device_register_request.dart';
import 'package:facturacion_app/features/auth/data/models/device_token_response.dart';
import 'package:facturacion_app/features/auth/data/repositories/auth_repository.dart';

part 'auth_provider.freezed.dart';
part 'auth_provider.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unconfigured({required String uuid}) = _Unconfigured;
  const factory AuthState.registering() = _Registering;
  const factory AuthState.unauthorized({
    required String baseUrl,
    required String uuid,
    required String deviceName,
    String? errorMessage,
    @Default(false) bool isCheckingToken,
  }) = _Unauthorized;
  const factory AuthState.authorized({
    required String token,
    required IslandConfig islandConfig,
  }) = _Authorized;
  const factory AuthState.error(String message) = _Error;
}

@riverpod
class Auth extends _$Auth {
  late SecureStorageService _secureStorage;
  late AuthRepository _repository;

  @override
  AuthState build() {
    _secureStorage = ref.watch(secureStorageServiceProvider);
    _repository = ref.watch(authRepositoryProvider);

    // Asynchronously initialize storage state
    _init();

    return const AuthState.initial();
  }

  Future<void> _init() async {
    try {
      final baseUrl = await _secureStorage.readBaseUrl();
      var uuid = await _secureStorage.readDeviceUuid();

      // Generate and persist UUID on first boot if not present
      if (uuid == null || uuid.isEmpty) {
        uuid = const Uuid().v4();
        await _secureStorage.writeDeviceUuid(uuid);
      }

      final token = await _secureStorage.readDeviceToken();
      final name =
          await _secureStorage.readDeviceName() ?? 'Tablet Despachador';
      final islandJson = await _secureStorage.readIslandConfig();

      if (token != null && islandJson != null && baseUrl != null) {
        try {
          final islandConfig = IslandConfig.fromJson(
            jsonDecode(islandJson) as Map<String, dynamic>,
          );
          state = AuthState.authorized(
            token: token,
            islandConfig: islandConfig,
          );
          return;
        } catch (_) {
          // Fall through if json is corrupted
        }
      }

      if (baseUrl != null) {
        state = AuthState.unauthorized(
          baseUrl: baseUrl,
          uuid: uuid,
          deviceName: name,
        );
      } else {
        state = AuthState.unconfigured(uuid: uuid);
      }
    } catch (e) {
      state = AuthState.error('Error al inicializar la app: $e');
    }
  }

  Future<bool> register(
    String baseUrl,
    String name,
    bool printerEnabled,
  ) async {
    state = const AuthState.registering();
    var uuid = await _secureStorage.readDeviceUuid();
    if (uuid == null || uuid.isEmpty) {
      uuid = const Uuid().v4();
      await _secureStorage.writeDeviceUuid(uuid);
    }

    try {
      String formattedUrl = baseUrl.trim();
      if (!formattedUrl.startsWith('http://') &&
          !formattedUrl.startsWith('https://') &&
          formattedUrl != 'mock') {
        // Default to http for local development (IP addresses or localhost)
        formattedUrl = 'http://$formattedUrl';
      }

      // Write values to secure storage so Dio interceptor has them
      await _secureStorage.writeBaseUrl(formattedUrl);
      await _secureStorage.writeDeviceName(name);
      await _secureStorage.writePrinterEnabled(printerEnabled);

      // Make real validation request
      final request = DeviceRegisterRequest(uuid: uuid, name: name);
      await _repository.registerDevice(request);

      state = AuthState.unauthorized(
        baseUrl: formattedUrl,
        uuid: uuid,
        deviceName: name,
      );
      return true;
    } catch (e) {
      print('=== ERROR DE CONEXIÓN ===: $e');
      // Revert base url & device name config on registration failure but keep hardware UUID!
      await _secureStorage.writeBaseUrl('');
      await _secureStorage.writeDeviceName('');
      state = AuthState.unconfigured(uuid: uuid);
      return false;
    }
  }

  Future<void> checkAuthorization() async {
    final currentState = state;
    if (currentState is! _Unauthorized) return;

    state = currentState.copyWith(isCheckingToken: true, errorMessage: null);

    try {
      final response = await _repository.fetchToken(currentState.uuid);

      await _secureStorage.writeDeviceToken(response.token);
      await _secureStorage.writeIslandConfig(
        jsonEncode(response.islandConfig.toJson()),
      );

      state = AuthState.authorized(
        token: response.token,
        islandConfig: response.islandConfig,
      );
    } catch (e) {
      state = currentState.copyWith(
        isCheckingToken: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<void> dummyAuthorize() async {
    final currentState = state;
    if (currentState is! _Unauthorized) return;

    // Dummy values
    final dummyToken = 'DUMMY_TOKEN_123';
    final dummyIslandConfig = const IslandConfig(
      id: 1,
      name: 'Isla 1',
      positions: [1, 2],
    );

    await _secureStorage.writeDeviceToken(dummyToken);
    await _secureStorage.writeIslandConfig(
      jsonEncode(dummyIslandConfig.toJson()),
    );

    state = AuthState.authorized(
      token: dummyToken,
      islandConfig: dummyIslandConfig,
    );
  }

  Future<void> logout() async {
    final uuid = await _secureStorage.readDeviceUuid();
    final printerEnabled = await _secureStorage.readPrinterEnabled();
    final printerAddress = await _secureStorage.readPrinterAddress();
    final printerType = await _secureStorage.readPrinterType();
    await _secureStorage.clearAll();

    // Restore persistent hardware UUID
    if (uuid != null && uuid.isNotEmpty) {
      await _secureStorage.writeDeviceUuid(uuid);
    }
    await _secureStorage.writePrinterEnabled(printerEnabled);
    if (printerAddress != null) {
      await _secureStorage.writePrinterAddress(printerAddress);
    }
    await _secureStorage.writePrinterType(printerType);

    state = AuthState.unconfigured(uuid: uuid ?? const Uuid().v4());
  }
}
