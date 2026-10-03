import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/devices/presentation/dashboard_screen.dart';
import '../../features/commands/presentation/quick_actions_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/quick-actions/:id',
      builder: (context, state) {
        final deviceId = state.pathParameters['id']!;
        final deviceName = state.extra as String? ?? 'Dispositivo';
        return QuickActionsScreen(deviceId: deviceId, deviceName: deviceName);
      },
    ),
  ],
);
