import 'package:injectable/injectable.dart';
import 'command_repository.dart';
import 'command.dart';

@injectable
class SendCommand {
  final CommandRepository _repository;

  SendCommand(this._repository);

  Future<DeviceCommand> call({
    required String deviceId,
    required CommandType type,
    String? payload,
  }) {
    return _repository.sendCommand(deviceId: deviceId, type: type, payload: payload);
  }
}
