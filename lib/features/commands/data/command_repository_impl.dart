import 'package:injectable/injectable.dart';
import '../domain/command_repository.dart';
import '../domain/command.dart';

@LazySingleton(as: CommandRepository)
class CommandRepositoryImpl implements CommandRepository {
  @override
  Future<DeviceCommand> sendCommand({
    required String deviceId,
    required CommandType type,
    String? payload,
  }) async {
    await Future.delayed(const Duration(seconds: 1)); // Mock network latency
    
    return DeviceCommand(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      deviceId: deviceId,
      type: type,
      status: CommandStatus.executed, // Mocking successful execution
      payload: payload,
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<List<DeviceCommand>> getHistory(String deviceId) async {
    await Future.delayed(const Duration(seconds: 1)); // Mock network delay
    return [
      DeviceCommand(
        id: 'cmd-1',
        deviceId: deviceId,
        type: CommandType.location,
        status: CommandStatus.delivered,
        payload: '-34.6037,-58.3816', // Buenos Aires mock location
        createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      DeviceCommand(
        id: 'cmd-2',
        deviceId: deviceId,
        type: CommandType.ring,
        status: CommandStatus.delivered,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      DeviceCommand(
        id: 'cmd-3',
        deviceId: deviceId,
        type: CommandType.lock,
        status: CommandStatus.pending,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];
  }
}
