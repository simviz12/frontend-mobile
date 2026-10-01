import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // TODO: Navigate to Quick Actions (Day 8)
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
