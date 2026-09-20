import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:event_alarm_mobile/app/app.dart';
import 'package:event_alarm_mobile/app/routes.dart';
import 'package:event_alarm_mobile/app/theme.dart';
import 'package:event_alarm_mobile/screens/alarm_editor/alarm_editor_screen.dart';
import 'package:event_alarm_mobile/screens/alarm_ringing/alarm_ringing_screen.dart';
import 'package:event_alarm_mobile/screens/challenge_selector/challenge_selector_screen.dart';
import 'package:event_alarm_mobile/screens/event_rule/event_rule_screen.dart';
import 'package:event_alarm_mobile/screens/home/home_screen.dart';
import 'package:event_alarm_mobile/screens/login/login_screen.dart';
import 'package:event_alarm_mobile/screens/splash/splash_screen.dart';

void main() {
  Future<void> setPhone(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }

  testWidgets('Splash screen shows brand copy and advances to login', (
    WidgetTester tester,
  ) async {
    await setPhone(tester);
    await tester.pumpWidget(const EventAlarmApp());
    expect(find.text('Alarma contextual'), findsOneWidget);
    expect(
      find.text('Despierta con el contexto, no solo con la hora'),
      findsOneWidget,
    );
    await tester.pump(SplashScreen.displayDuration);
    await tester.pumpAndSettle();
    expect(find.text('Inicia sesión'), findsOneWidget);
  });

  testWidgets('Login navigates to home', (WidgetTester tester) async {
    await setPhone(tester);
    await tester.pumpWidget(const EventAlarmApp());
    await tester.pump(SplashScreen.displayDuration);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Iniciar sesión'));
    await tester.pumpAndSettle();
    expect(find.text('Mis alarmas'), findsOneWidget);
    expect(find.text('Parcial de Cálculo · Lun Mié Vie'), findsOneWidget);
  });

  testWidgets('Screens fit a 360x800 viewport without overflow', (
    WidgetTester tester,
  ) async {
    final Map<String, Widget> screens = <String, Widget>{
      'splash': const SplashScreen(),
      'login': const LoginScreen(),
      'home': const HomeScreen(),
      'editor': const AlarmEditorScreen(),
      'event': const EventRuleScreen(),
      'challenge': const ChallengeSelectorScreen(),
      'ringing': const AlarmRingingScreen(),
    };

    await tester.binding.setSurfaceSize(const Size(360, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    for (final MapEntry<String, Widget> entry in screens.entries) {
      await tester.pumpWidget(
        MaterialApp(theme: AppTheme.dark, home: entry.value),
      );
      await tester.pump();
      expect(
        tester.takeException(),
        isNull,
        reason: 'Overflow on ${entry.key}',
      );
    }
  });

  testWidgets('Named routes resolve', (WidgetTester tester) async {
    await setPhone(tester);
    await tester.pumpWidget(const EventAlarmApp());
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pushReplacementNamed(AppRoutes.home);
    await tester.pumpAndSettle();
    expect(find.text('Mis alarmas'), findsOneWidget);
  });

  testWidgets('Editor retos row opens challenge selector then ringing', (
    WidgetTester tester,
  ) async {
    await setPhone(tester);
    await tester.pumpWidget(const EventAlarmApp());
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pushReplacementNamed(AppRoutes.alarmEditor);
    await tester.pumpAndSettle();
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Retos para desactivar la alarma'));
    await tester.pumpAndSettle();
    expect(find.text('Cómo apagarla'), findsOneWidget);
    navigator.pop();
    await tester.pumpAndSettle();
    expect(find.text('Configurar alarma'), findsOneWidget);
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Retos para desactivar la alarma'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Probar el reto ahora'));
    await tester.pumpAndSettle();
    expect(find.text('Apagar alarma'), findsOneWidget);
  });
}
