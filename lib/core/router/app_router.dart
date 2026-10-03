import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/devices/presentation/dashboard_screen.dart';
import '../../features/devices/presentation/link_device_screen.dart';
import '../../features/commands/presentation/quick_actions_screen.dart';
import '../../features/commands/presentation/commands_history_screen.dart';
import '../../features/theft_mode/presentation/theft_mode_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/location/presentation/live_location_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/link-device',
      builder: (context, state) => const LinkDeviceScreen(),
    ),
    GoRoute(
      path: '/quick-actions/:id',
      builder: (context, state) {
        final deviceId = state.pathParameters['id']!;
        final deviceName = state.extra as String? ?? 'Dispositivo';
        return QuickActionsScreen(deviceId: deviceId, deviceName: deviceName);
      },
    ),
    GoRoute(
      path: '/history/:id',
      builder: (context, state) {
        final deviceId = state.pathParameters['id']!;
        return CommandsHistoryScreen(deviceId: deviceId);
      },
    ),
    GoRoute(
      path: '/theft-mode/:id',
      builder: (context, state) {
        final deviceId = state.pathParameters['id']!;
        final deviceName = state.extra as String? ?? 'Dispositivo';
        return TheftModeScreen(deviceId: deviceId, deviceName: deviceName);
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/live-location/:id',
      builder: (context, state) =>
          LiveLocationScreen(deviceId: state.pathParameters['id']!),
    ),
  ],
);
