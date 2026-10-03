import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/commands/domain/command.dart';
import 'package:guardian_mobile/features/commands/domain/command_repository.dart';
import 'package:guardian_mobile/features/commands/domain/send_command.dart';

class MockCommandRepository extends Mock implements CommandRepository {}

void main() {
  late MockCommandRepository mockRepository;
  late SendCommand usecase;

  setUp(() {
    mockRepository = MockCommandRepository();
    usecase = SendCommand(mockRepository);
  });

  const tDeviceId = 'device123';
  const tType = CommandType.ring;
  final tCommand = DeviceCommand(
    id: 'cmd1',
    deviceId: tDeviceId,
    type: tType,
    status: CommandStatus.pending,
    createdAt: DateTime.now(),
  );

  test('should return DeviceCommand when successful', () async {
    when(
      () => mockRepository.sendCommand(
        deviceId: tDeviceId,
        type: tType,
        payload: null,
      ),
    ).thenAnswer((_) async => tCommand);

    final result = await usecase(deviceId: tDeviceId, type: tType);

    expect(result, tCommand);
    verify(
      () => mockRepository.sendCommand(
        deviceId: tDeviceId,
        type: tType,
        payload: null,
      ),
    ).called(1);
  });
}
