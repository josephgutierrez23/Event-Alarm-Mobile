import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';
import '../../shared/design_canvas.dart';
import '../../widgets/atoms/app_text.dart';
import '../../widgets/atoms/gesture_pill.dart';
import '../../widgets/atoms/section_overline.dart';
import '../../widgets/molecules/challenge_step_slider.dart';
import '../../widgets/organisms/challenge_configuration_section.dart';
import '../../widgets/organisms/challenge_type_grid.dart';
import '../../widgets/organisms/mobile_top_bar.dart';

class ChallengeSelectorScreen extends StatefulWidget {
  const ChallengeSelectorScreen({super.key});

  @override
  State<ChallengeSelectorScreen> createState() =>
      _ChallengeSelectorScreenState();
}

class _ChallengeSelectorScreenState extends State<ChallengeSelectorScreen> {
  int _selected = 0;
  bool _swapOnFail = true;
  double _fillWidth = ChallengeStepSlider.figmaFill;

  int get _steps {
    final int mapped = (_fillWidth / ChallengeStepSlider.trackWidth * 60)
        .round();
    return mapped.clamp(5, 60);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noche900,
      body: DesignCanvas(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 24,
              child: MobileTopBar(
                title: 'Cómo apagarla',
                onBack: () => Navigator.pop(context),
                borderColor: AppColors.noche600,
                titleHeight: 28,
              ),
            ),
            const Positioned(
              left: 16,
              top: 104,
              width: 328,
              child: AppText(
                'Elige el reto que tendrás que completar para que la alarma se detenga.',
                style: TextStyle(
                  fontFamily: AppTypography.manrope,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 20 / 14,
                  color: AppColors.niebla200,
                ),
              ),
            ),
            const Positioned(
              left: 16,
              top: 160,
              child: SectionOverline('TIPO DE RETO'),
            ),
            Positioned(
              left: AppSpacing.screen,
              top: 188,
              child: ChallengeTypeGrid(
                selectedIndex: _selected,
                onSelected: (int index) => setState(() => _selected = index),
              ),
            ),
            Positioned(
              left: AppSpacing.screen,
              top: 508,
              child: ChallengeConfigurationSection(
                steps: _steps,
                fillWidth: _fillWidth,
                swapOnFail: _swapOnFail,
                onFillChanged: (double value) =>
                    setState(() => _fillWidth = value),
                onSwapOnFailChanged: (bool value) =>
                    setState(() => _swapOnFail = value),
                onTest: () =>
                    Navigator.pushNamed(context, AppRoutes.alarmRinging),
              ),
            ),
            const Positioned(left: 0, top: 776, child: GesturePill()),
          ],
        ),
      ),
    );
  }
}
