import 'package:injectable/injectable.dart';
import 'command.dart';
import 'command_repository.dart';

@injectable
class GetCommandsHistory {
  final CommandRepository _repository;

  GetCommandsHistory(this._repository);

  Future<List<DeviceCommand>> call(String deviceId) async {
    final commands = await _repository.getHistory(deviceId);
    return commands..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}
