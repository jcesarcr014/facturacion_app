import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'secure_storage_service.dart';

part 'dio_client.g.dart';

@riverpod
Dio dioClient(DioClientRef ref) {
  final secureStorage = ref.watch(secureStorageServiceProvider);
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // If the path is a relative path, resolve the baseUrl dynamically from SecureStorage
        final isAbsolute = options.path.startsWith('http://') || options.path.startsWith('https://');
        if (!isAbsolute) {
          final baseUrl = await secureStorage.readBaseUrl();
          if (baseUrl != null && baseUrl.isNotEmpty) {
            options.baseUrl = baseUrl;
          }
        }

        // Add the Authorization header if the device token exists
        final token = await secureStorage.readDeviceToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        options.connectTimeout = const Duration(seconds: 15);
        options.receiveTimeout = const Duration(seconds: 15);
        options.headers['Accept'] = 'application/json';

        return handler.next(options);
      },
    ),
  );

  return dio;
}
