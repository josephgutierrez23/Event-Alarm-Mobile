import 'package:flutter/material.dart';

import '../../design_system/dimensions.dart';
import '../../design_system/spacing.dart';
import '../../design_system/typography.dart';
import '../molecules/am_pm_toggle.dart';
import '../molecules/app_text_field.dart';
import '../molecules/day_selector.dart';
import '../molecules/labeled_setting_row.dart';
import '../molecules/time_display.dart';
import 'alarm_editor_nav_section.dart';
import 'alarm_editor_sound_section.dart';

class AlarmEditorContent extends StatelessWidget {
  const AlarmEditorContent({
    super.key,
    required this.isAm,
    required this.eventDriven,
    required this.conviviality,
    required this.volume,
    required this.days,
    required this.nameController,
    required this.onAmChanged,
    required this.onEventDrivenChanged,
    required this.onConvivialityChanged,
    required this.onVolumeChanged,
    required this.onDayChanged,
    required this.onSave,
    required this.onOpenEvents,
    required this.onOpenChallenges,
  });

  final bool isAm;
  final bool eventDriven;
  final bool conviviality;
  final double volume;
  final List<bool> days;
  final TextEditingController nameController;
  final ValueChanged<bool> onAmChanged;
  final ValueChanged<bool> onEventDrivenChanged;
  final ValueChanged<bool> onConvivialityChanged;
  final ValueChanged<double> onVolumeChanged;
  final ValueChanged<int> onDayChanged;
  final VoidCallback onSave;
  final VoidCallback onOpenEvents;
  final VoidCallback onOpenChallenges;

  static const List<String> _dayLabels = <String>[
    'D',
    'L',
    'M',
    'M',
    'J',
    'V',
    'S',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.canvasWidth,
      height: 890,
      child: Stack(
        children: [
          Positioned(
            left: AppSpacing.screen,
            top: 16,
            child: SizedBox(
              width: 328,
              height: 120,
              child: Stack(
                children: [
                  const Positioned(
                    left: 0,
                    top: 20,
                    child: TimeDisplay(
                      time: '06:15',
                      style: AppTypography.clockL,
                    ),
                  ),
                  Positioned(
                    left: 248,
                    top: 40,
                    child: AmPmToggle(isAm: isAm, onChanged: onAmChanged),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: AppSpacing.screen,
            top: 152,
            child: LabeledSettingRow(
              title: 'Alarma dirigida por eventos',
              subtitle:
                  'Suena solo cuando ocurra el evento que configures, sin una hora fija.',
              value: eventDriven,
              onChanged: onEventDrivenChanged,
              boxed: true,
            ),
          ),
          Positioned(
            left: AppSpacing.screen,
            top: 256,
            child: DaySelector(
              labels: _dayLabels,
              selected: days,
              onChanged: onDayChanged,
            ),
          ),
          Positioned(
            left: AppSpacing.screen,
            top: 320,
            child: AppTextField(
              label: 'Nombre de la alarma',
              hint: 'Parcial de Cálculo',
              controller: nameController,
            ),
          ),
          Positioned(
            left: AppSpacing.screen,
            top: 387,
            child: AlarmEditorSoundSection(
              conviviality: conviviality,
              volume: volume,
              onConvivialityChanged: onConvivialityChanged,
              onVolumeChanged: onVolumeChanged,
            ),
          ),
          Positioned(
            left: AppSpacing.screen,
            top: 623,
            child: AlarmEditorNavSection(
              onSave: onSave,
              onOpenEvents: onOpenEvents,
              onOpenChallenges: onOpenChallenges,
            ),
          ),
        ],
      ),
    );
  }
}
