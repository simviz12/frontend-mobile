import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/commands/domain/command.dart';
import 'package:guardian_mobile/features/commands/domain/command_repository.dart';
import 'package:guardian_mobile/features/commands/domain/get_commands_history.dart';

class MockCommandRepository extends Mock implements CommandRepository {}

void main() {
  late MockCommandRepository mockRepository;
  late GetCommandsHistory useCase;

  setUp(() {
    mockRepository = MockCommandRepository();
    useCase = GetCommandsHistory(mockRepository);
  });

  final tCmd1 = DeviceCommand(
    id: 'cmd-1',
    deviceId: 'dev-1',
    type: CommandType.ring,
    status: CommandStatus.delivered,
    createdAt: DateTime(2026, 1, 1, 10, 0),
  );

  final tCmd2 = DeviceCommand(
    id: 'cmd-2',
    deviceId: 'dev-1',
    type: CommandType.lock,
    status: CommandStatus.pending,
    createdAt: DateTime(2026, 1, 1, 12, 0),
  );

  test('should return list sorted by createdAt descending', () async {
    when(
      () => mockRepository.getHistory('dev-1'),
    ).thenAnswer((_) async => [tCmd1, tCmd2]);

    final result = await useCase('dev-1');

    expect(result.length, 2);
    expect(result.first.id, 'cmd-2'); // More recent first
    expect(result.last.id, 'cmd-1');
    verify(() => mockRepository.getHistory('dev-1')).called(1);
  });
}
