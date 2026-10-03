import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../domain/command.dart';
import 'quick_actions_notifier.dart';

class QuickActionsScreen extends ConsumerWidget {
  final String deviceId;
  final String deviceName;

  const QuickActionsScreen({
    super.key,
    required this.deviceId,
    required this.deviceName,
  });

  void _confirmAndExecute(
    BuildContext context,
    WidgetRef ref,
    CommandType type, {
    String? title,
    String? message,
    bool isDestructive = false,
  }) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title ?? 'Confirmar acción'),
        content: Text(message ?? '¿Deseas enviar este comando al dispositivo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: isDestructive
                ? ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                  )
                : null,
            child: const Text('Ejecutar'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      unawaited(
        ref
            .read(quickActionsNotifierProvider(deviceId).notifier)
            .executeCommand(type),
      );
    }
  }

  void _showMessageDialog(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    final message = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Mostrar Mensaje'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Escribe un mensaje para la pantalla',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: const Text('Enviar'),
          ),
        ],
      ),
    );

    if (message != null && message.isNotEmpty) {
      unawaited(
        ref
            .read(quickActionsNotifierProvider(deviceId).notifier)
            .executeCommand(CommandType.message, payload: message),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quickActionsNotifierProvider(deviceId));

    ref.listen<QuickActionsState>(quickActionsNotifierProvider(deviceId), (
      previous,
      next,
    ) {
      next.maybeWhen(
        success: (cmd) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Comando entregado: ${cmd.type.name}')),
        ),
        error: (err) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $err'), backgroundColor: Colors.red),
        ),
        orElse: () {},
      );
    });

    final isSending = state.maybeWhen(
      sending: (_) => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(title: Text(deviceName)),
      body: Stack(
        children: [
          GridView.count(
            padding: const EdgeInsets.all(16),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _ActionCard(
                title: 'Hacer Sonar',
                icon: Icons.volume_up,
                color: Colors.blue,
                onTap: isSending
                    ? null
                    : () => ref
                          .read(quickActionsNotifierProvider(deviceId).notifier)
                          .executeCommand(CommandType.ring),
              ),
              _ActionCard(
                title: 'Vibrar',
                icon: Icons.vibration,
                color: Colors.orange,
                onTap: isSending
                    ? null
                    : () => ref
                          .read(quickActionsNotifierProvider(deviceId).notifier)
                          .executeCommand(CommandType.vibrate),
              ),
              _ActionCard(
                title: 'Localizar',
                icon: Icons.location_on,
                color: Colors.green,
                onTap: isSending
                    ? null
                    : () => context.push('/live-location/$deviceId'),
              ),
              _ActionCard(
                title: 'Mensaje',
                icon: Icons.message,
                color: Colors.purple,
                onTap: isSending
                    ? null
                    : () => _showMessageDialog(context, ref),
              ),
              _ActionCard(
                title: 'Bloquear',
                icon: Icons.lock,
                color: Colors.redAccent,
                onTap: isSending
                    ? null
                    : () => _confirmAndExecute(
                        context,
                        ref,
                        CommandType.lock,
                        title: 'Bloquear Dispositivo',
                        message:
                            'El dispositivo se bloqueará con su PIN/Contraseña actual.',
                      ),
              ),
              _ActionCard(
                title: 'Modo Robo',
                icon: Icons.warning,
                color: Theme.of(context).colorScheme.error,
                isDestructive: true,
                onTap: () =>
                    context.push('/theft-mode/$deviceId', extra: deviceName),
              ),
            ],
          ),
          if (isSending)
            Container(
              color: Colors.black45,
              child: const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Enviando comando...'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final bool isDestructive;

  const _ActionCard({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isDestructive
            ? const BorderSide(color: Colors.red, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
