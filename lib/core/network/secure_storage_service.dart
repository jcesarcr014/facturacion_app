import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_service.g.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  static const String _keyBaseUrl = 'base_url';
  static const String _keyDeviceUuid = 'device_uuid';
  static const String _keyDeviceToken = 'device_token';
  static const String _keyIslandConfig = 'island_config';
  static const String _keyDeviceName = 'device_name';
  static const String _keyPrinterEnabled = 'printer_enabled';
  static const String _keyPrinterAddress = 'printer_address';
  static const String _keyPrinterType = 'printer_type';
  static const String _keyPrinterWidth = 'printer_width';
  static const String _keyPrinterFontSize = 'printer_font_size';
  static const String _keyIntegratedModel = 'integrated_model';
  static const String _keyUsbVendorId = 'usb_vendor_id';
  static const String _keyUsbProductId = 'usb_product_id';

  Future<void> writeBaseUrl(String url) async {
    await _storage.write(key: _keyBaseUrl, value: url);
  }

  Future<String?> readBaseUrl() async {
    return await _storage.read(key: _keyBaseUrl);
  }

  Future<void> writeDeviceUuid(String uuid) async {
    await _storage.write(key: _keyDeviceUuid, value: uuid);
  }

  Future<String?> readDeviceUuid() async {
    return await _storage.read(key: _keyDeviceUuid);
  }

  Future<void> writeDeviceToken(String token) async {
    await _storage.write(key: _keyDeviceToken, value: token);
  }

  Future<String?> readDeviceToken() async {
    return await _storage.read(key: _keyDeviceToken);
  }

  Future<void> writeIslandConfig(String configJson) async {
    await _storage.write(key: _keyIslandConfig, value: configJson);
  }

  Future<String?> readIslandConfig() async {
    return await _storage.read(key: _keyIslandConfig);
  }

  Future<void> writeDeviceName(String name) async {
    await _storage.write(key: _keyDeviceName, value: name);
  }

  Future<String?> readDeviceName() async {
    return await _storage.read(key: _keyDeviceName);
  }

  Future<void> writePrinterEnabled(bool enabled) async {
    await _storage.write(key: _keyPrinterEnabled, value: enabled ? 'true' : 'false');
  }

  Future<bool> readPrinterEnabled() async {
    final value = await _storage.read(key: _keyPrinterEnabled);
    return value == 'true';
  }

  Future<void> writePrinterAddress(String address) async {
    await _storage.write(key: _keyPrinterAddress, value: address);
  }

  Future<String?> readPrinterAddress() async {
    return await _storage.read(key: _keyPrinterAddress);
  }

  Future<void> writePrinterType(String type) async {
    await _storage.write(key: _keyPrinterType, value: type);
  }

  Future<String> readPrinterType() async {
    final value = await _storage.read(key: _keyPrinterType);
    return value ?? 'none';
  }

  Future<void> writePrinterWidth(int width) async {
    await _storage.write(key: _keyPrinterWidth, value: width.toString());
  }

  Future<int> readPrinterWidth() async {
    final value = await _storage.read(key: _keyPrinterWidth);
    return value != null ? int.parse(value) : 32; // Default to 32 chars (58mm)
  }

  Future<void> writePrinterFontSize(int size) async {
    await _storage.write(key: _keyPrinterFontSize, value: size.toString());
  }

  Future<int> readPrinterFontSize() async {
    final value = await _storage.read(key: _keyPrinterFontSize);
    return value != null ? int.parse(value) : 0; // Default to 0
  }

  Future<void> writeIntegratedModel(String model) async {
    await _storage.write(key: _keyIntegratedModel, value: model);
  }

  Future<String> readIntegratedModel() async {
    final value = await _storage.read(key: _keyIntegratedModel);
    return value ?? 'sunmi';
  }

  Future<void> writeUsbPrinter(String vendorId, String productId) async {
    await _storage.write(key: _keyUsbVendorId, value: vendorId);
    await _storage.write(key: _keyUsbProductId, value: productId);
  }

  Future<Map<String, String>?> readUsbPrinter() async {
    final vendor = await _storage.read(key: _keyUsbVendorId);
    final product = await _storage.read(key: _keyUsbProductId);
    if (vendor != null && product != null) {
      return {'vendorId': vendor, 'productId': product};
    }
    return null;
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

@riverpod
SecureStorageService secureStorageService(SecureStorageServiceRef ref) {
  return SecureStorageService(const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  ));
}
