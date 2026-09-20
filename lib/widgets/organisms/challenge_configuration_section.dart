import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/typography.dart';
import '../atoms/app_text.dart';
import '../atoms/section_overline.dart';
import '../molecules/app_switch.dart';
import '../molecules/challenge_step_slider.dart';
import '../molecules/outlined_action_button.dart';

class ChallengeConfigurationSection extends StatelessWidget {
  const ChallengeConfigurationSection({
    super.key,
    required this.steps,
    required this.fillWidth,
    required this.swapOnFail,
    required this.onFillChanged,
    required this.onSwapOnFailChanged,
    required this.onTest,
  });

  final int steps;
  final double fillWidth;
  final bool swapOnFail;
  final ValueChanged<double> onFillChanged;
  final ValueChanged<bool> onSwapOnFailChanged;
  final VoidCallback onTest;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.controlWidth,
      height: 234.2,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            top: 0,
            child: SectionOverline('CONFIGURACIÓN DEL RETO'),
          ),
          const Positioned(
            left: 0,
            top: 28,
            child: AppText(
              'Cantidad de pasos',
              style: TextStyle(
                fontFamily: AppTypography.manrope,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
                color: AppColors.niebla200,
              ),
            ),
          ),
          Positioned(
            left: 248,
            top: 24,
            child: SizedBox(
              width: 80,
              height: 28,
              child: Align(
                alignment: Alignment.centerRight,
                child: AppText(
                  '$steps',
                  style: const TextStyle(
                    fontFamily: AppTypography.archivo,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    height: 28 / 22,
                    color: AppColors.niebla050,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 52,
            child: ChallengeStepSlider(
              fillWidth: fillWidth,
              onFillChanged: onFillChanged,
            ),
          ),
          const Positioned(
            left: 0,
            top: 86.2,
            width: 328,
            child: AppText(
              'Pasos que deberás caminar para apagar la alarma.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTypography.manrope,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 16 / 12,
                color: AppColors.niebla200,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 118.2,
            child: Container(
              width: AppDimensions.controlWidth,
              height: AppDimensions.fieldHeight,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.noche600, width: 0.8),
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: AppText(
                      'Cambiar el reto si fallo',
                      style: TextStyle(
                        fontFamily: AppTypography.manrope,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 24 / 16,
                        color: AppColors.niebla050,
                      ),
                    ),
                  ),
                  AppSwitch(
                    value: swapOnFail,
                    thumbColor: AppColors.noche950,
                    onChanged: onSwapOnFailChanged,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 186.2,
            child: OutlinedActionButton(
              label: 'Probar el reto ahora',
              onPressed: onTest,
            ),
          ),
        ],
      ),
    );
  }
}
