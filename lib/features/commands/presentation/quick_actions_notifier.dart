import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/di/injection.dart';
import '../domain/send_command.dart';
import '../domain/command.dart';

part 'quick_actions_notifier.freezed.dart';

@freezed
sealed class QuickActionsState with _$QuickActionsState {
  const factory QuickActionsState.idle() = _Idle;
  const factory QuickActionsState.sending(CommandType type) = _Sending;
  const factory QuickActionsState.success(DeviceCommand command) = _Success;
  const factory QuickActionsState.error(String message) = _Error;
}

class QuickActionsNotifier extends StateNotifier<QuickActionsState> {
  final SendCommand _sendCommand;
  final String deviceId;

  QuickActionsNotifier(this._sendCommand, {required this.deviceId})
    : super(const QuickActionsState.idle());

  Future<void> executeCommand(CommandType type, {String? payload}) async {
    state = QuickActionsState.sending(type);
    try {
      final command = await _sendCommand(
        deviceId: deviceId,
        type: type,
        payload: payload,
      );
      state = QuickActionsState.success(command);

      // Return to idle after a short delay
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        state = const QuickActionsState.idle();
      }
    } catch (e) {
      state = QuickActionsState.error(e.toString());
    }
  }
}

final quickActionsNotifierProvider =
    StateNotifierProvider.family<
      QuickActionsNotifier,
      QuickActionsState,
      String
    >((ref, deviceId) {
      return QuickActionsNotifier(getIt<SendCommand>(), deviceId: deviceId);
    });
