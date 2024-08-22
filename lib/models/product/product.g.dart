// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String? ?? '',
      price: json['price'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      region: json['region'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      chatCount: json['chatCount'] as String? ?? '',
      favoriteCount: json['favoriteCount'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'desc': instance.desc,
      'region': instance.region,
      'uid': instance.uid,
      'userName': instance.userName,
      'chatCount': instance.chatCount,
      'favoriteCount': instance.favoriteCount,
    };
