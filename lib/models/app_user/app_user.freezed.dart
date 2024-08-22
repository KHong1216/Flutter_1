// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  List<String> get chatId => throw _privateConstructorUsedError;
  List<String> get favoriteProduct => throw _privateConstructorUsedError;
  List<String> get favoriteCommunity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      List<String> chatId,
      List<String> favoriteProduct,
      List<String> favoriteCommunity});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? chatId = null,
    Object? favoriteProduct = null,
    Object? favoriteCommunity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteProduct: null == favoriteProduct
          ? _value.favoriteProduct
          : favoriteProduct // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteCommunity: null == favoriteCommunity
          ? _value.favoriteCommunity
          : favoriteCommunity // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      List<String> chatId,
      List<String> favoriteProduct,
      List<String> favoriteCommunity});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? chatId = null,
    Object? favoriteProduct = null,
    Object? favoriteCommunity = null,
  }) {
    return _then(_$AppUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: null == chatId
          ? _value._chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteProduct: null == favoriteProduct
          ? _value._favoriteProduct
          : favoriteProduct // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoriteCommunity: null == favoriteCommunity
          ? _value._favoriteCommunity
          : favoriteCommunity // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AppUserImpl with DiagnosticableTreeMixin implements _AppUser {
  const _$AppUserImpl(
      {this.id = '',
      this.name = '',
      this.email = '',
      final List<String> chatId = const [],
      final List<String> favoriteProduct = const [],
      final List<String> favoriteCommunity = const []})
      : _chatId = chatId,
        _favoriteProduct = favoriteProduct,
        _favoriteCommunity = favoriteCommunity;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  final List<String> _chatId;
  @override
  @JsonKey()
  List<String> get chatId {
    if (_chatId is EqualUnmodifiableListView) return _chatId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatId);
  }

  final List<String> _favoriteProduct;
  @override
  @JsonKey()
  List<String> get favoriteProduct {
    if (_favoriteProduct is EqualUnmodifiableListView) return _favoriteProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteProduct);
  }

  final List<String> _favoriteCommunity;
  @override
  @JsonKey()
  List<String> get favoriteCommunity {
    if (_favoriteCommunity is EqualUnmodifiableListView)
      return _favoriteCommunity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteCommunity);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUser(id: $id, name: $name, email: $email, chatId: $chatId, favoriteProduct: $favoriteProduct, favoriteCommunity: $favoriteCommunity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('chatId', chatId))
      ..add(DiagnosticsProperty('favoriteProduct', favoriteProduct))
      ..add(DiagnosticsProperty('favoriteCommunity', favoriteCommunity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other._chatId, _chatId) &&
            const DeepCollectionEquality()
                .equals(other._favoriteProduct, _favoriteProduct) &&
            const DeepCollectionEquality()
                .equals(other._favoriteCommunity, _favoriteCommunity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      const DeepCollectionEquality().hash(_chatId),
      const DeepCollectionEquality().hash(_favoriteProduct),
      const DeepCollectionEquality().hash(_favoriteCommunity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {final String id,
      final String name,
      final String email,
      final List<String> chatId,
      final List<String> favoriteProduct,
      final List<String> favoriteCommunity}) = _$AppUserImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  List<String> get chatId;
  @override
  List<String> get favoriteProduct;
  @override
  List<String> get favoriteCommunity;
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
