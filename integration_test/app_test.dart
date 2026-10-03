import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:guardian_mobile/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('login, view dashboard, navigate to settings', (tester) async {
      app.main();

      // Wait for app to start and microtasks to finish
      await tester.pumpAndSettle();

      // Ensure we are on login screen by finding email field
      expect(find.byType(TextFormField), findsNWidgets(2));

      // Enter login details
      await tester.enterText(
        find.byType(TextFormField).first,
        'admin@guardian.com',
      );
      await tester.enterText(find.byType(TextFormField).last, 'password123');

      // Tap login button
      await tester.tap(find.text('Ingresar'));

      // Settle the navigation animation and any data fetching
      await tester.pumpAndSettle();

      // Find 'Dispositivos Vinculados' text indicating we are on dashboard
      expect(find.text('Dispositivos Vinculados'), findsOneWidget);

      // Verify we can find the mock device card
      expect(find.textContaining('Pixel 7 Pro'), findsOneWidget);

      // Tap on the device card to open quick actions
      await tester.tap(find.textContaining('Pixel 7 Pro'));
      await tester.pumpAndSettle();

      // Verify we are on Quick Actions screen
      expect(find.textContaining('Acciones: Pixel 7 Pro'), findsOneWidget);

      // Find the 'Bloquear' card and tap it
      expect(find.text('Bloquear'), findsOneWidget);
      await tester.tap(find.text('Bloquear'));
      await tester.pumpAndSettle();

      // Verify dialog appears and tap 'Ejecutar'
      expect(find.text('Ejecutar'), findsOneWidget);
      await tester.tap(find.text('Ejecutar'));
      await tester.pumpAndSettle();

      // Go back to dashboard
      await tester.pageBack();
      await tester.pumpAndSettle();

      // Verify we can find settings button (using Icons.settings)
      final settingsIcon = find.byIcon(Icons.settings);
      expect(settingsIcon, findsOneWidget);

      // Tap settings button
      await tester.tap(settingsIcon);
      await tester.pumpAndSettle();

      // Verify we are on settings screen
      expect(find.text('Configuración'), findsOneWidget);
      expect(find.text('Cerrar Sesión'), findsOneWidget);

      // Tap logout
      await tester.tap(find.text('Cerrar Sesión'));
      await tester.pumpAndSettle();

      // Verify we are back on login screen
      expect(find.text('Ingresar'), findsOneWidget);
    });
  });
}
