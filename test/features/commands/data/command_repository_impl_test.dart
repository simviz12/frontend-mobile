import 'package:flutter_test/flutter_test.dart';
import 'package:guardian_mobile/features/commands/data/command_repository_impl.dart';
import 'package:guardian_mobile/features/commands/domain/command.dart';

void main() {
  late CommandRepositoryImpl repository;

  setUp(() {
    repository = CommandRepositoryImpl();
  });

  test('sendCommand returns executed DeviceCommand', () async {
    final cmd = await repository.sendCommand(
      deviceId: 'dev-1',
      type: CommandType.lock,
    );

    expect(cmd.deviceId, 'dev-1');
    expect(cmd.type, CommandType.lock);
    expect(cmd.status, CommandStatus.executed);
  });

  test('getHistory returns list of commands for deviceId', () async {
    final history = await repository.getHistory('dev-1');

    expect(history.length, 3);
    expect(history.first.deviceId, 'dev-1');
  });
}
