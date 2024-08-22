// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCommunityDocHash() => r'5842adc4a9fef19206b0fcc3b15422aa5dc3fcd2';

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

/// See also [getCommunityDoc].
@ProviderFor(getCommunityDoc)
const getCommunityDocProvider = GetCommunityDocFamily();

/// See also [getCommunityDoc].
class GetCommunityDocFamily extends Family<AsyncValue<DocumentSnapshot>> {
  /// See also [getCommunityDoc].
  const GetCommunityDocFamily();

  /// See also [getCommunityDoc].
  GetCommunityDocProvider call(
    String id,
  ) {
    return GetCommunityDocProvider(
      id,
    );
  }

  @override
  GetCommunityDocProvider getProviderOverride(
    covariant GetCommunityDocProvider provider,
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
  String? get name => r'getCommunityDocProvider';
}

/// See also [getCommunityDoc].
class GetCommunityDocProvider
    extends AutoDisposeStreamProvider<DocumentSnapshot> {
  /// See also [getCommunityDoc].
  GetCommunityDocProvider(
    String id,
  ) : this._internal(
          (ref) => getCommunityDoc(
            ref as GetCommunityDocRef,
            id,
          ),
          from: getCommunityDocProvider,
          name: r'getCommunityDocProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCommunityDocHash,
          dependencies: GetCommunityDocFamily._dependencies,
          allTransitiveDependencies:
              GetCommunityDocFamily._allTransitiveDependencies,
          id: id,
        );

  GetCommunityDocProvider._internal(
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
    Stream<DocumentSnapshot> Function(GetCommunityDocRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCommunityDocProvider._internal(
        (ref) => create(ref as GetCommunityDocRef),
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
  AutoDisposeStreamProviderElement<DocumentSnapshot> createElement() {
    return _GetCommunityDocProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommunityDocProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCommunityDocRef on AutoDisposeStreamProviderRef<DocumentSnapshot> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetCommunityDocProviderElement
    extends AutoDisposeStreamProviderElement<DocumentSnapshot>
    with GetCommunityDocRef {
  _GetCommunityDocProviderElement(super.provider);

  @override
  String get id => (origin as GetCommunityDocProvider).id;
}

String _$createCommentHash() => r'97ba4656f60e90c7278dade9180138da63acf8e8';

/// See also [CreateComment].
@ProviderFor(CreateComment)
final createCommentProvider =
    AutoDisposeAsyncNotifierProvider<CreateComment, void>.internal(
  CreateComment.new,
  name: r'createCommentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createCommentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateComment = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
