import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../atoms/app_text.dart';
import '../atoms/section_overline.dart';
import '../molecules/labeled_setting_row.dart';
import '../molecules/nav_row.dart';
import '../molecules/volume_slider.dart';

class AlarmEditorSoundSection extends StatelessWidget {
  const AlarmEditorSoundSection({
    super.key,
    required this.conviviality,
    required this.volume,
    required this.onConvivialityChanged,
    required this.onVolumeChanged,
  });

  final bool conviviality;
  final double volume;
  final ValueChanged<bool> onConvivialityChanged;
  final ValueChanged<double> onVolumeChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 212,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            top: 0,
            child: SectionOverline('SONIDO Y VIBRACIÓN'),
          ),
          const Positioned(
            left: 0,
            top: 28,
            child: NavRow(
              title: 'Tono',
              trailingLabel: 'Amanecer suave',
              boxed: false,
            ),
          ),
          Positioned(
            left: 0,
            top: 92,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  'Volumen progresivo',
                  style: TextStyle(
                    fontFamily: AppTypography.manrope,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    height: 22 / 15,
                    color: AppColors.niebla050,
                  ),
                ),
                const AppText(
                  'Llega al máximo en 45 s',
                  style: AppTypography.metaSecondary,
                ),
                const SizedBox(height: 4),
                VolumeSlider(value: volume, onChanged: onVolumeChanged),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 164,
            child: LabeledSettingRow(
              title: 'Modo convivencia',
              subtitle: 'Limita el volumen al 60 %',
              value: conviviality,
              onChanged: onConvivialityChanged,
            ),
          ),
        ],
      ),
    );
  }
}
