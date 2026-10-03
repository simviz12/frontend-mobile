import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/presentation/login_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            subtitle: Text('juan.perez@example.com'), // Mock user for now
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Permisos Avanzados'),
            subtitle: const Text('Configurar permisos del dispositivo'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Los permisos se gestionan desde el sistema.'),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              'Cerrar Sesión',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () {
              ref.read(loginNotifierProvider.notifier).logout();
              context.go('/');
            },
          ),
        ],
      ),
    );
  }
}
