import 'package:freezed_annotation/freezed_annotation.dart';

part 'command.freezed.dart';
part 'command.g.dart';

enum CommandType {
  ring,
  location,
  lock,
  message,
  vibrate,
  wipe,
  theftMode,
  battery,
}

enum CommandStatus { pending, delivered, executed, failed }

@freezed
abstract class DeviceCommand with _$DeviceCommand {
  const factory DeviceCommand({
    required String id,
    required String deviceId,
    required CommandType type,
    required CommandStatus status,
    String? payload, // For message text or lock password
    required DateTime createdAt,
  }) = _DeviceCommand;

  factory DeviceCommand.fromJson(Map<String, dynamic> json) =>
      _$DeviceCommandFromJson(json);
}
