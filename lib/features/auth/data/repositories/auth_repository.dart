import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../models/device_register_request.dart';
import '../models/device_token_response.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<void> registerDevice(DeviceRegisterRequest request) async {
    await _dio.post('/api/v1/devices/register', data: request.toJson());
  }

  Future<DeviceTokenResponse> fetchToken(String uuid) async {
    final response = await _dio.get('/api/v1/devices/token/$uuid');
    return DeviceTokenResponse.fromJson(response.data);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(dioClientProvider));
}
