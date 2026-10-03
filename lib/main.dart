import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
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
