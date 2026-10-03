import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardian_mobile/main.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('ExampleScreen displays primary and danger buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: GuardianMobileApp()));

    expect(find.text('Design System Validation'), findsOneWidget);
    expect(find.text('Card Title'), findsOneWidget);
    expect(find.text('Primary Button'), findsOneWidget);
    expect(find.text('Danger Button'), findsOneWidget);
    
    // Check for standard Card widget
    expect(find.byType(Card), findsOneWidget);
  });
}
