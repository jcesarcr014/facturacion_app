// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pumpSalesHash() => r'4e578c286c4431e4f715f14ae537a35d249fefb8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [pumpSales].
@ProviderFor(pumpSales)
const pumpSalesProvider = PumpSalesFamily();

/// See also [pumpSales].
class PumpSalesFamily extends Family<AsyncValue<List<Despacho>>> {
  /// See also [pumpSales].
  const PumpSalesFamily();

  /// See also [pumpSales].
  PumpSalesProvider call(int positionId) {
    return PumpSalesProvider(positionId);
  }

  @override
  PumpSalesProvider getProviderOverride(covariant PumpSalesProvider provider) {
    return call(provider.positionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pumpSalesProvider';
}

/// See also [pumpSales].
class PumpSalesProvider extends AutoDisposeFutureProvider<List<Despacho>> {
  /// See also [pumpSales].
  PumpSalesProvider(int positionId)
    : this._internal(
        (ref) => pumpSales(ref as PumpSalesRef, positionId),
        from: pumpSalesProvider,
        name: r'pumpSalesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pumpSalesHash,
        dependencies: PumpSalesFamily._dependencies,
        allTransitiveDependencies: PumpSalesFamily._allTransitiveDependencies,
        positionId: positionId,
      );

  PumpSalesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.positionId,
  }) : super.internal();

  final int positionId;

  @override
  Override overrideWith(
    FutureOr<List<Despacho>> Function(PumpSalesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PumpSalesProvider._internal(
        (ref) => create(ref as PumpSalesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        positionId: positionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Despacho>> createElement() {
    return _PumpSalesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PumpSalesProvider && other.positionId == positionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, positionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PumpSalesRef on AutoDisposeFutureProviderRef<List<Despacho>> {
  /// The parameter `positionId` of this provider.
  int get positionId;
}

class _PumpSalesProviderElement
    extends AutoDisposeFutureProviderElement<List<Despacho>>
    with PumpSalesRef {
  _PumpSalesProviderElement(super.provider);

  @override
  int get positionId => (origin as PumpSalesProvider).positionId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
