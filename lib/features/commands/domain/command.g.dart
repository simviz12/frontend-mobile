// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceCommand _$DeviceCommandFromJson(Map<String, dynamic> json) =>
    _DeviceCommand(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      type: $enumDecode(_$CommandTypeEnumMap, json['type']),
      status: $enumDecode(_$CommandStatusEnumMap, json['status']),
      payload: json['payload'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DeviceCommandToJson(_DeviceCommand instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'type': _$CommandTypeEnumMap[instance.type]!,
      'status': _$CommandStatusEnumMap[instance.status]!,
      'payload': instance.payload,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$CommandTypeEnumMap = {
  CommandType.ring: 'ring',
  CommandType.location: 'location',
  CommandType.lock: 'lock',
  CommandType.message: 'message',
  CommandType.vibrate: 'vibrate',
  CommandType.wipe: 'wipe',
  CommandType.theftMode: 'theftMode',
  CommandType.battery: 'battery',
};

const _$CommandStatusEnumMap = {
  CommandStatus.pending: 'pending',
  CommandStatus.delivered: 'delivered',
  CommandStatus.executed: 'executed',
  CommandStatus.failed: 'failed',
};
