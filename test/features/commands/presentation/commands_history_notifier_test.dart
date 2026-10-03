import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/commands/domain/command.dart';
import 'package:guardian_mobile/features/commands/domain/get_commands_history.dart';
import 'package:guardian_mobile/features/commands/presentation/commands_history_notifier.dart';

class MockGetCommandsHistory extends Mock implements GetCommandsHistory {}

void main() {
  late MockGetCommandsHistory mockGetCommandsHistory;

  setUp(() {
    mockGetCommandsHistory = MockGetCommandsHistory();
  });

  final tCommands = [
    DeviceCommand(
      id: 'cmd-1',
      deviceId: 'dev-1',
      type: CommandType.ring,
      status: CommandStatus.delivered,
      createdAt: DateTime(2026, 1, 1),
    ),
  ];

  test('should load history and transition to loaded state on init', () async {
    when(
      () => mockGetCommandsHistory('dev-1'),
    ).thenAnswer((_) async => tCommands);

    final notifier = CommandsHistoryNotifier(
      mockGetCommandsHistory,
      deviceId: 'dev-1',
    );

    await Future.microtask(() {});

    expect(notifier.state, CommandsHistoryState.loaded(tCommands));
    verify(() => mockGetCommandsHistory('dev-1')).called(1);
  });

  test('should emit error state when getHistory fails', () async {
    when(
      () => mockGetCommandsHistory('dev-1'),
    ).thenThrow(Exception('Failed to load history'));

    final notifier = CommandsHistoryNotifier(
      mockGetCommandsHistory,
      deviceId: 'dev-1',
    );

    await Future.microtask(() {});

    expect(
      notifier.state,
      const CommandsHistoryState.error('Exception: Failed to load history'),
    );
  });
}
