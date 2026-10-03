import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../commands/domain/command.dart';
import '../../commands/presentation/quick_actions_notifier.dart';

class TheftModeScreen extends ConsumerWidget {
  final String deviceId;
  final String deviceName;

  const TheftModeScreen({
    super.key,
    required this.deviceId,
    required this.deviceName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quickActionsNotifierProvider(deviceId));
    final isSending = state.maybeWhen(
      sending: (_) => true,
      orElse: () => false,
    );

    ref.listen(quickActionsNotifierProvider(deviceId), (prev, next) {
      next.whenOrNull(
        error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $msg'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        ),
        success: (cmd) {
          if (cmd.type == CommandType.theftMode) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Modo Robo activado correctamente.'),
              ),
            );
            Navigator.pop(context);
          }
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Modo Robo - $deviceName'),
        backgroundColor: Theme.of(context).colorScheme.error,
        foregroundColor: Theme.of(context).colorScheme.onError,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 24),
            Text(
              '¡Atención!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Al activar el Modo Robo, el dispositivo se bloqueará inmediatamente, comenzará a sonar una alarma a máximo volumen, y empezará a transmitir su ubicación continuamente. Además, se impedirá apagar el dispositivo fácilmente.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            if (isSending)
              const Center(child: CircularProgressIndicator())
            else
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(quickActionsNotifierProvider(deviceId).notifier)
                      .executeCommand(CommandType.theftMode);
                },
                icon: const Icon(Icons.shield),
                label: const Text('ACTIVAR MODO ROBO'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.onError,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: isSending ? null : () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
