import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/commands/domain/command.dart';
import 'package:guardian_mobile/features/commands/domain/send_command.dart';
import 'package:guardian_mobile/features/commands/presentation/quick_actions_notifier.dart';

class MockSendCommand extends Mock implements SendCommand {}

void main() {
  late MockSendCommand mockSendCommand;
  late QuickActionsNotifier notifier;

  setUp(() {
    mockSendCommand = MockSendCommand();
    notifier = QuickActionsNotifier(mockSendCommand, deviceId: 'dev-1');
  });

  final tCommand = DeviceCommand(
    id: 'cmd-1',
    deviceId: 'dev-1',
    type: CommandType.ring,
    status: CommandStatus.pending,
    createdAt: DateTime(2026, 1, 1),
  );

  test('initial state should be QuickActionsState.idle', () {
    expect(notifier.state, const QuickActionsState.idle());
  });

  test(
    'should transition to sending and success when command is successful',
    () async {
      when(
        () => mockSendCommand(
          deviceId: 'dev-1',
          type: CommandType.ring,
          payload: null,
        ),
      ).thenAnswer((_) async => tCommand);

      final states = <QuickActionsState>[];
      notifier.addListener((s) => states.add(s));

      await notifier.executeCommand(CommandType.ring);

      expect(
        states.contains(const QuickActionsState.sending(CommandType.ring)),
        isTrue,
      );
      expect(states.contains(QuickActionsState.success(tCommand)), isTrue);
    },
  );

  test('should transition to sending and error when command throws', () async {
    when(
      () => mockSendCommand(
        deviceId: 'dev-1',
        type: CommandType.ring,
        payload: null,
      ),
    ).thenThrow(Exception('Network error'));

    final states = <QuickActionsState>[];
    notifier.addListener((s) => states.add(s));

    await notifier.executeCommand(CommandType.ring);

    expect(
      states.contains(const QuickActionsState.sending(CommandType.ring)),
      isTrue,
    );
    expect(
      states.contains(
        const QuickActionsState.error('Exception: Network error'),
      ),
      isTrue,
    );
  });
}
