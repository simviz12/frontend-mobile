import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/auth/presentation/login_screen.dart';
import 'package:guardian_mobile/features/auth/presentation/login_notifier.dart';
import 'package:guardian_mobile/features/auth/domain/user.dart';

class MockLoginNotifier extends StateNotifier<LoginState> with Mock implements LoginNotifier {
  MockLoginNotifier() : super(const LoginState.initial());
}

void main() {
  late MockLoginNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockLoginNotifier();
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        loginNotifierProvider.overrideWith((ref) => mockNotifier),
      ],
      child: const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }

  testWidgets('renders login form and buttons', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Guardian Mobile'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2)); // Email and Password
    expect(find.text('Ingresar'), findsOneWidget);
  });

  testWidgets('shows loading indicator when state is loading', (WidgetTester tester) async {
    // Cannot easily change state of mock without it being complex, but we can override state
    mockNotifier.state = const LoginState.loading();
    
    await tester.pumpWidget(createWidgetUnderTest());
    
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Ingresar'), findsNothing);
  });

  testWidgets('calls login when button is pressed', (WidgetTester tester) async {
    when(() => mockNotifier.login(any(), any())).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());

    // Enter text
    await tester.enterText(find.byType(TextFormField).first, 'test@test.com');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    
    // Tap button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(() => mockNotifier.login('test@test.com', 'password123')).called(1);
  });
}
