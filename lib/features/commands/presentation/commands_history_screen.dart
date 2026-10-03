import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import '../domain/command.dart';
import 'commands_history_notifier.dart';

class CommandsHistoryScreen extends ConsumerWidget {
  final String deviceId;

  const CommandsHistoryScreen({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commandsHistoryNotifierProvider(deviceId));

    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Rastreo')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (msg) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $msg', style: TextStyle(color: Theme.of(context).colorScheme.error)),
              TextButton(
                onPressed: () => ref.read(commandsHistoryNotifierProvider(deviceId).notifier).load(),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        loaded: (commands) {
          if (commands.isEmpty) {
            return const Center(child: Text('No hay comandos recientes.'));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(commandsHistoryNotifierProvider(deviceId).notifier).load(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: commands.length,
              itemBuilder: (context, index) {
                final cmd = commands[index];
                return _CommandCard(command: cmd);
              },
            ),
          );
        },
      ),
    );
  }
}

class _CommandCard extends StatelessWidget {
  final DeviceCommand command;
  const _CommandCard({required this.command});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy, HH:mm');
    final isLocation = command.type == CommandType.location && command.payload != null && command.payload!.contains(',');
    
    LatLng? location;
    if (isLocation) {
      final parts = command.payload!.split(',');
      if (parts.length == 2) {
        location = LatLng(double.tryParse(parts[0]) ?? 0, double.tryParse(parts[1]) ?? 0);
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getIconForCommand(command.type), color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _getTitleForCommand(command.type),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Text(
                  dateFormat.format(command.createdAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            if (command.status == CommandStatus.pending)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 12, height: 12, child: CircularProgressIndicator(strokeWidth: 2)),
                    const SizedBox(width: 8),
                    Text('Pendiente', style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                  ],
                ),
              ),
            if (location != null)
              Container(
                height: 150,
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                ),
                clipBehavior: Clip.antiAlias,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: location,
                    initialZoom: 15.0,
                    interactionOptions: const InteractionOptions(flags: InteractiveFlag.none),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.simviz12.guardian_mobile',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: location,
                          width: 40,
                          height: 40,
                          child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForCommand(CommandType type) {
    switch (type) {
      case CommandType.ring: return Icons.volume_up;
      case CommandType.vibrate: return Icons.vibration;
      case CommandType.message: return Icons.message;
      case CommandType.lock: return Icons.lock;
      case CommandType.wipe: return Icons.delete_forever;
      case CommandType.location: return Icons.location_on;
      case CommandType.battery: return Icons.battery_charging_full;
      case CommandType.theftMode: return Icons.warning;
    }
  }

  String _getTitleForCommand(CommandType type) {
    switch (type) {
      case CommandType.ring: return 'Alarma';
      case CommandType.vibrate: return 'Vibración';
      case CommandType.message: return 'Mensaje en Pantalla';
      case CommandType.lock: return 'Bloqueo Remoto';
      case CommandType.wipe: return 'Borrado Remoto';
      case CommandType.location: return 'Ubicación Rastreada';
      case CommandType.battery: return 'Reporte de Batería';
      case CommandType.theftMode: return 'Modo Robo';
    }
  }
}
