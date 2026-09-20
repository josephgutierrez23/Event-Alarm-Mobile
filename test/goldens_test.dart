import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:event_alarm_mobile/app/theme.dart';
import 'package:event_alarm_mobile/screens/alarm_editor/alarm_editor_screen.dart';
import 'package:event_alarm_mobile/screens/alarm_ringing/alarm_ringing_screen.dart';
import 'package:event_alarm_mobile/screens/challenge_selector/challenge_selector_screen.dart';
import 'package:event_alarm_mobile/screens/event_rule/event_rule_screen.dart';
import 'package:event_alarm_mobile/screens/home/home_screen.dart';
import 'package:event_alarm_mobile/screens/login/login_screen.dart';
import 'package:event_alarm_mobile/screens/splash/splash_screen.dart';

void main() {
  Future<void> pumpScreen(WidgetTester tester, Widget screen) async {
    await tester.binding.setSurfaceSize(const Size(360, 800));
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
      tester.view.resetDevicePixelRatio();
    });
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        home: screen,
      ),
    );
    await tester.pump();
  }

  testWidgets('golden splash', (tester) async {
    await pumpScreen(tester, const SplashScreen());
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/splash.png'),
    );
  });

  testWidgets('golden login', (tester) async {
    await pumpScreen(tester, const LoginScreen());
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/login.png'),
    );
  });

  testWidgets('golden home', (tester) async {
    await pumpScreen(tester, const HomeScreen());
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/home.png'),
    );
  });

  testWidgets('golden editor', (tester) async {
    await pumpScreen(tester, const AlarmEditorScreen());
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/editor.png'),
    );
  });

  testWidgets('golden event', (tester) async {
    await pumpScreen(tester, const EventRuleScreen());
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/event.png'),
    );
  });

  testWidgets('golden challenge', (tester) async {
    await pumpScreen(tester, const ChallengeSelectorScreen());
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/challenge.png'),
    );
  });

  testWidgets('golden ringing', (tester) async {
    await pumpScreen(tester, const AlarmRingingScreen());
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/ringing.png'),
    );
  });
}
