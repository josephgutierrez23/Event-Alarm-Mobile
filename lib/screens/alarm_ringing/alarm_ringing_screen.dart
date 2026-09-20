import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';
import '../../shared/design_canvas.dart';
import '../../widgets/atoms/app_text.dart';
import '../../widgets/atoms/gesture_pill.dart';
import '../../widgets/organisms/alarm_ringing_actions.dart';
import '../../widgets/organisms/alarm_ringing_visual.dart';

class AlarmRingingScreen extends StatelessWidget {
  const AlarmRingingScreen({super.key});

  void _goHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noche950,
      body: DesignCanvas(
        background: AppColors.noche950,
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              right: 0,
              top: 96,
              child: AppText(
                'ALARMA EN CURSO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.manrope,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  height: 14 / 10,
                  letterSpacing: 1,
                  color: AppColors.live,
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 136,
              child: AppText(
                '06:15',
                style: AppTypography.clockL,
                textAlign: TextAlign.center,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 224,
              child: AppText(
                'Parcial de Cálculo',
                style: AppTypography.highlighted,
                textAlign: TextAlign.center,
              ),
            ),
            const Positioned(
              left: AppSpacing.screen,
              right: AppSpacing.screen,
              top: 260,
              child: AppText(
                'Activada por geocerca · Estación Calle 45',
                style: AppTypography.metaSecondary,
                textAlign: TextAlign.center,
              ),
            ),
            const Positioned(left: 80, top: 336, child: AlarmRingingVisual()),
            const Positioned(
              left: AppSpacing.screen,
              right: AppSpacing.screen,
              top: 568,
              child: AppText(
                'El volumen sube gradualmente · Nivel 3 de 7',
                style: AppTypography.metaSecondary,
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: AppSpacing.screen,
              top: 608,
              child: AlarmRingingActions(
                onSnooze: () => _goHome(context),
                onDismiss: () => _goHome(context),
              ),
            ),
            const Positioned(left: 0, top: 776, child: GesturePill()),
          ],
        ),
      ),
    );
  }
}
