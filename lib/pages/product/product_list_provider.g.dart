// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productProfileHash() => r'844f3c01ec640dd7ff77216a29d449696e860017';

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

/// See also [productProfile].
@ProviderFor(productProfile)
const productProfileProvider = ProductProfileFamily();

/// See also [productProfile].
class ProductProfileFamily extends Family<AsyncValue<Product>> {
  /// See also [productProfile].
  const ProductProfileFamily();

  /// See also [productProfile].
  ProductProfileProvider call(
    String id,
  ) {
    return ProductProfileProvider(
      id,
    );
  }

  @override
  ProductProfileProvider getProviderOverride(
    covariant ProductProfileProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'productProfileProvider';
}

/// See also [productProfile].
class ProductProfileProvider extends AutoDisposeFutureProvider<Product> {
  /// See also [productProfile].
  ProductProfileProvider(
    String id,
  ) : this._internal(
          (ref) => productProfile(
            ref as ProductProfileRef,
            id,
          ),
          from: productProfileProvider,
          name: r'productProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productProfileHash,
          dependencies: ProductProfileFamily._dependencies,
          allTransitiveDependencies:
              ProductProfileFamily._allTransitiveDependencies,
          id: id,
        );

  ProductProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Product> Function(ProductProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductProfileProvider._internal(
        (ref) => create(ref as ProductProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _ProductProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductProfileProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductProfileRef on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductProfileProviderElement
    extends AutoDisposeFutureProviderElement<Product> with ProductProfileRef {
  _ProductProfileProviderElement(super.provider);

  @override
  String get id => (origin as ProductProfileProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
