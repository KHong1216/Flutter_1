// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getChatDocHash() => r'28be9655a3f6c1b2d4b6c9db2e36306b2307eee5';

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

/// See also [getChatDoc].
@ProviderFor(getChatDoc)
const getChatDocProvider = GetChatDocFamily();

/// See also [getChatDoc].
class GetChatDocFamily extends Family<AsyncValue<DocumentSnapshot>> {
  /// See also [getChatDoc].
  const GetChatDocFamily();

  /// See also [getChatDoc].
  GetChatDocProvider call(
    String chatId,
  ) {
    return GetChatDocProvider(
      chatId,
    );
  }

  @override
  GetChatDocProvider getProviderOverride(
    covariant GetChatDocProvider provider,
  ) {
    return call(
      provider.chatId,
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
  String? get name => r'getChatDocProvider';
}

/// See also [getChatDoc].
class GetChatDocProvider extends AutoDisposeStreamProvider<DocumentSnapshot> {
  /// See also [getChatDoc].
  GetChatDocProvider(
    String chatId,
  ) : this._internal(
          (ref) => getChatDoc(
            ref as GetChatDocRef,
            chatId,
          ),
          from: getChatDocProvider,
          name: r'getChatDocProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getChatDocHash,
          dependencies: GetChatDocFamily._dependencies,
          allTransitiveDependencies:
              GetChatDocFamily._allTransitiveDependencies,
          chatId: chatId,
        );

  GetChatDocProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
  }) : super.internal();

  final String chatId;

  @override
  Override overrideWith(
    Stream<DocumentSnapshot> Function(GetChatDocRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetChatDocProvider._internal(
        (ref) => create(ref as GetChatDocRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DocumentSnapshot> createElement() {
    return _GetChatDocProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetChatDocProvider && other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetChatDocRef on AutoDisposeStreamProviderRef<DocumentSnapshot> {
  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _GetChatDocProviderElement
    extends AutoDisposeStreamProviderElement<DocumentSnapshot>
    with GetChatDocRef {
  _GetChatDocProviderElement(super.provider);

  @override
  String get chatId => (origin as GetChatDocProvider).chatId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
