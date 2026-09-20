import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design_system/colors.dart';
import '../screens/alarm_editor/alarm_editor_screen.dart';
import '../screens/alarm_ringing/alarm_ringing_screen.dart';
import '../screens/challenge_selector/challenge_selector_screen.dart';
import '../screens/event_rule/event_rule_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'routes.dart';
import 'theme.dart';

class EventAlarmApp extends StatelessWidget {
  const EventAlarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.noche950,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: MaterialApp(
        title: 'Alarma contextual',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.noScaling),
            child: child ?? const SizedBox.shrink(),
          );
        },
        initialRoute: AppRoutes.splash,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  static Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      AppRoutes.splash => const SplashScreen(),
      AppRoutes.login => const LoginScreen(),
      AppRoutes.home => const HomeScreen(),
      AppRoutes.alarmEditor => const AlarmEditorScreen(),
      AppRoutes.eventRule => const EventRuleScreen(),
      AppRoutes.challengeSelector => const ChallengeSelectorScreen(),
      AppRoutes.alarmRinging => const AlarmRingingScreen(),
      _ => const SplashScreen(),
    };

    return PageRouteBuilder<void>(
      settings: settings,
      pageBuilder: (_, _, _) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}
