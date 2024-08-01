// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['_id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      avatar: json['avatar'],
      bio: json['bio'],
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'createdAt': instance.createdAt,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userName: json['userName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
    };
