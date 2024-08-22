// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$communityProfileHash() => r'b103b0efb1999b6b7be5eabd4e8f7ffc8779c333';

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

/// See also [communityProfile].
@ProviderFor(communityProfile)
const communityProfileProvider = CommunityProfileFamily();

/// See also [communityProfile].
class CommunityProfileFamily extends Family<AsyncValue<Community>> {
  /// See also [communityProfile].
  const CommunityProfileFamily();

  /// See also [communityProfile].
  CommunityProfileProvider call(
    String postId,
  ) {
    return CommunityProfileProvider(
      postId,
    );
  }

  @override
  CommunityProfileProvider getProviderOverride(
    covariant CommunityProfileProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'communityProfileProvider';
}

/// See also [communityProfile].
class CommunityProfileProvider extends AutoDisposeFutureProvider<Community> {
  /// See also [communityProfile].
  CommunityProfileProvider(
    String postId,
  ) : this._internal(
          (ref) => communityProfile(
            ref as CommunityProfileRef,
            postId,
          ),
          from: communityProfileProvider,
          name: r'communityProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$communityProfileHash,
          dependencies: CommunityProfileFamily._dependencies,
          allTransitiveDependencies:
              CommunityProfileFamily._allTransitiveDependencies,
          postId: postId,
        );

  CommunityProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(
    FutureOr<Community> Function(CommunityProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommunityProfileProvider._internal(
        (ref) => create(ref as CommunityProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Community> createElement() {
    return _CommunityProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommunityProfileProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommunityProfileRef on AutoDisposeFutureProviderRef<Community> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _CommunityProfileProviderElement
    extends AutoDisposeFutureProviderElement<Community>
    with CommunityProfileRef {
  _CommunityProfileProviderElement(super.provider);

  @override
  String get postId => (origin as CommunityProfileProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
