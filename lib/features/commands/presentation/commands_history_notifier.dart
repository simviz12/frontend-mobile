import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/di/injection.dart';
import '../domain/command.dart';
import '../domain/get_commands_history.dart';

part 'commands_history_notifier.freezed.dart';

@freezed
sealed class CommandsHistoryState with _$CommandsHistoryState {
  const factory CommandsHistoryState.loading() = _Loading;
  const factory CommandsHistoryState.loaded(List<DeviceCommand> commands) = _Loaded;
  const factory CommandsHistoryState.error(String message) = _Error;
}

class CommandsHistoryNotifier extends StateNotifier<CommandsHistoryState> {
  final GetCommandsHistory _getCommandsHistory;
  final String deviceId;

  CommandsHistoryNotifier(this._getCommandsHistory, {required this.deviceId}) : super(const CommandsHistoryState.loading()) {
    load();
  }

  Future<void> load() async {
    state = const CommandsHistoryState.loading();
    try {
      final commands = await _getCommandsHistory(deviceId);
      if (mounted) {
        state = CommandsHistoryState.loaded(commands);
      }
    } catch (e) {
      if (mounted) {
        state = CommandsHistoryState.error(e.toString());
      }
    }
  }
}

final commandsHistoryNotifierProvider = StateNotifierProvider.family<CommandsHistoryNotifier, CommandsHistoryState, String>((ref, deviceId) {
  return CommandsHistoryNotifier(getIt<GetCommandsHistory>(), deviceId: deviceId);
});
