// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: json['id'] as String,
  name: json['name'] as String,
  status: json['status'] as String,
  batteryLevel: (json['batteryLevel'] as num).toInt(),
  lastSeen: DateTime.parse(json['lastSeen'] as String),
  isProtected: json['isProtected'] as bool,
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': instance.status,
  'batteryLevel': instance.batteryLevel,
  'lastSeen': instance.lastSeen.toIso8601String(),
  'isProtected': instance.isProtected,
};
