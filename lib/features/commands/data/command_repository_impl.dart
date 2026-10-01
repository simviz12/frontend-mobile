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
}
