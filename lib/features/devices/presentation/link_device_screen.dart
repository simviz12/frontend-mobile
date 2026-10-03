import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/di/injection.dart';
import '../domain/link_device.dart';
import '../../device_agent/domain/agent_usecases.dart';

class LinkDeviceScreen extends ConsumerStatefulWidget {
  const LinkDeviceScreen({super.key});

  @override
  ConsumerState<LinkDeviceScreen> createState() => _LinkDeviceScreenState();
}

class _LinkDeviceScreenState extends ConsumerState<LinkDeviceScreen> {
  bool _isLoading = false;
  String? _error;

  Future<void> _link(bool isProtected) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      if (isProtected) {
        final requestAdmin = getIt<RequestDeviceAdmin>();
        final adminGranted = await requestAdmin();
        if (!adminGranted) {
          throw Exception('Se requieren permisos de administrador para proteger este celular.');
        }
      }

      final linker = getIt<LinkDevice>();
      await linker(isProtected: isProtected);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Dispositivo vinculado exitosamente.')));
        context.go('/dashboard'); // Go back to dashboard or home
      }
    } catch (e) {
      if (mounted) {
        setState(() => _error = e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vincular este celular')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.devices, size: 80, color: Color(0xFF006948)),
            const SizedBox(height: 24),
            Text(
              '¿Cómo usarás este dispositivo?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Elige si quieres que este celular sea rastreado y protegido, o si lo usarás solo para administrar otros dispositivos.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 48),
            if (_error != null) ...[
              Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              const SizedBox(height: 16),
            ],
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else ...[
              ElevatedButton.icon(
                onPressed: () => _link(true),
                icon: const Icon(Icons.security),
                label: const Text('Dispositivo Protegido'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => _link(false),
                icon: const Icon(Icons.admin_panel_settings),
                label: const Text('Solo Controlador'),
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
