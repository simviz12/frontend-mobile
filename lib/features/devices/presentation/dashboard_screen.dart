import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'devices_notifier.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(devicesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispositivos Vinculados'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Link new device
            },
          ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $message'),
              TextButton(
                onPressed: () => ref.read(devicesNotifierProvider.notifier).loadDevices(),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        loaded: (devices) {
          if (devices.isEmpty) {
            return const Center(child: Text('No hay dispositivos vinculados.'));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(devicesNotifierProvider.notifier).loadDevices(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                final isConnected = device.status == 'connected';

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: isConnected ? Colors.green.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                      child: Icon(
                        Icons.smartphone,
                        color: isConnected ? Colors.green : Colors.grey,
                      ),
                    ),
                    title: Text(device.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('Batería: \${device.batteryLevel}%'),
                        Text(isConnected ? 'Conectado ahora' : 'Última conexión: hace poco'),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) async {
                        if (value == 'rename') {
                          final controller = TextEditingController(text: device.name);
                          final newName = await showDialog<String>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Renombrar dispositivo'),
                              content: TextField(
                                controller: controller,
                                decoration: const InputDecoration(hintText: 'Nuevo nombre'),
                              ),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
                                ElevatedButton(onPressed: () => Navigator.pop(ctx, controller.text), child: const Text('Guardar')),
                              ],
                            ),
                          );
                          if (newName != null && newName.isNotEmpty) {
                            ref.read(devicesNotifierProvider.notifier).rename(device.id, newName);
                          }
                        } else if (value == 'unlink') {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Desvincular dispositivo'),
                              content: const Text('¿Estás seguro de que deseas desvincular este dispositivo? Perderás el acceso remoto.'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(ctx, true),
                                  style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
                                  child: const Text('Desvincular'),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            ref.read(devicesNotifierProvider.notifier).unlink(device.id);
                          }
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'rename', child: Text('Renombrar')),
                        const PopupMenuItem(value: 'unlink', child: Text('Desvincular')),
                      ],
                    ),
                    onTap: () {
                      context.push('/quick-actions/\${device.id}', extra: device.name);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
