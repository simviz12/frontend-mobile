import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/di/injection.dart';
import 'features/device_agent/domain/agent_usecases.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Here we would configure dependencies for background if needed,
  // but we can also instantiate the use case directly or use getIt.
  // For simplicity, assuming getIt is initialized or we just use MethodChannel directly here
  // Actually, we must configure dependencies to use getIt.
  configureDependencies();
  
  final commandType = message.data['commandType'] as String?;
  if (commandType != null) {
    final executeCommand = getIt<ExecuteCommandLocally>();
    await executeCommand(commandType);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const ProviderScope(child: GuardianMobileApp()));
}

class GuardianMobileApp extends StatelessWidget {
  const GuardianMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Guardian Mobile',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
