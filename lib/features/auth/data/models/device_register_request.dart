import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_register_request.freezed.dart';
part 'device_register_request.g.dart';

@freezed
class DeviceRegisterRequest with _$DeviceRegisterRequest {
  const factory DeviceRegisterRequest({
    required String uuid,
    required String name,
  }) = _DeviceRegisterRequest;

  factory DeviceRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceRegisterRequestFromJson(json);
}
