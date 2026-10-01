// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$printerServiceHash() => r'9ffc358323a892c9a726d7c550a9598e8bd484f1';

/// See also [printerService].
@ProviderFor(printerService)
final printerServiceProvider = AutoDisposeProvider<PrinterService>.internal(
  printerService,
  name: r'printerServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$printerServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PrinterServiceRef = AutoDisposeProviderRef<PrinterService>;
String _$printerEnabledHash() => r'd402257c1fc2be01fefc7a0443fde102b6cff1af';

/// See also [PrinterEnabled].
@ProviderFor(PrinterEnabled)
final printerEnabledProvider =
    AutoDisposeAsyncNotifierProvider<PrinterEnabled, bool>.internal(
      PrinterEnabled.new,
      name: r'printerEnabledProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$printerEnabledHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PrinterEnabled = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
