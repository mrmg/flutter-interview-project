// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$marketProviderHash() => r'7c7bf4ba01831cd6578a69f0f17fd3b7033fcdbf';

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

/// See also [marketProvider].
@ProviderFor(marketProvider)
const marketProviderProvider = MarketProviderFamily();

/// See also [marketProvider].
class MarketProviderFamily extends Family<AsyncValue<List<Market>>> {
  /// See also [marketProvider].
  const MarketProviderFamily();

  /// See also [marketProvider].
  MarketProviderProvider call([
    AssetBundle? bundle,
  ]) {
    return MarketProviderProvider(
      bundle,
    );
  }

  @override
  MarketProviderProvider getProviderOverride(
    covariant MarketProviderProvider provider,
  ) {
    return call(
      provider.bundle,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'marketProviderProvider';
}

/// See also [marketProvider].
class MarketProviderProvider extends AutoDisposeFutureProvider<List<Market>> {
  /// See also [marketProvider].
  MarketProviderProvider([
    AssetBundle? bundle,
  ]) : this._internal(
          (ref) => marketProvider(
            ref as MarketProviderRef,
            bundle,
          ),
          from: marketProviderProvider,
          name: r'marketProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$marketProviderHash,
          dependencies: MarketProviderFamily._dependencies,
          allTransitiveDependencies:
              MarketProviderFamily._allTransitiveDependencies,
          bundle: bundle,
        );

  MarketProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bundle,
  }) : super.internal();

  final AssetBundle? bundle;

  @override
  Override overrideWith(
    FutureOr<List<Market>> Function(MarketProviderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MarketProviderProvider._internal(
        (ref) => create(ref as MarketProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bundle: bundle,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Market>> createElement() {
    return _MarketProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MarketProviderProvider && other.bundle == bundle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bundle.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MarketProviderRef on AutoDisposeFutureProviderRef<List<Market>> {
  /// The parameter `bundle` of this provider.
  AssetBundle? get bundle;
}

class _MarketProviderProviderElement
    extends AutoDisposeFutureProviderElement<List<Market>>
    with MarketProviderRef {
  _MarketProviderProviderElement(super.provider);

  @override
  AssetBundle? get bundle => (origin as MarketProviderProvider).bundle;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
