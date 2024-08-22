// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductDocHash() => r'f4df25bc3c6833b0a40c5f6415037ac3c8174dc0';

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

/// See also [getProductDoc].
@ProviderFor(getProductDoc)
const getProductDocProvider = GetProductDocFamily();

/// See also [getProductDoc].
class GetProductDocFamily extends Family<AsyncValue<DocumentSnapshot>> {
  /// See also [getProductDoc].
  const GetProductDocFamily();

  /// See also [getProductDoc].
  GetProductDocProvider call(
    String id,
  ) {
    return GetProductDocProvider(
      id,
    );
  }

  @override
  GetProductDocProvider getProviderOverride(
    covariant GetProductDocProvider provider,
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
  String? get name => r'getProductDocProvider';
}

/// See also [getProductDoc].
class GetProductDocProvider
    extends AutoDisposeFutureProvider<DocumentSnapshot> {
  /// See also [getProductDoc].
  GetProductDocProvider(
    String id,
  ) : this._internal(
          (ref) => getProductDoc(
            ref as GetProductDocRef,
            id,
          ),
          from: getProductDocProvider,
          name: r'getProductDocProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductDocHash,
          dependencies: GetProductDocFamily._dependencies,
          allTransitiveDependencies:
              GetProductDocFamily._allTransitiveDependencies,
          id: id,
        );

  GetProductDocProvider._internal(
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
    FutureOr<DocumentSnapshot> Function(GetProductDocRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductDocProvider._internal(
        (ref) => create(ref as GetProductDocRef),
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
  AutoDisposeFutureProviderElement<DocumentSnapshot> createElement() {
    return _GetProductDocProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductDocProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductDocRef on AutoDisposeFutureProviderRef<DocumentSnapshot> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetProductDocProviderElement
    extends AutoDisposeFutureProviderElement<DocumentSnapshot>
    with GetProductDocRef {
  _GetProductDocProviderElement(super.provider);

  @override
  String get id => (origin as GetProductDocProvider).id;
}

String _$productFavoriteHash() => r'a47aef554c633bfe1da0c4858919eb86f69061bc';

/// See also [ProductFavorite].
@ProviderFor(ProductFavorite)
final productFavoriteProvider =
    AutoDisposeAsyncNotifierProvider<ProductFavorite, void>.internal(
  ProductFavorite.new,
  name: r'productFavoriteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productFavoriteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductFavorite = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
