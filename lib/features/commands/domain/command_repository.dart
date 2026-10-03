import 'command.dart';

abstract class CommandRepository {
  Future<DeviceCommand> sendCommand({
    required String deviceId,
    required CommandType type,
    String? payload,
  });
}
