import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_text.dart';
import 'app_switch.dart';

class LabeledSettingRow extends StatelessWidget {
  const LabeledSettingRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.boxed = false,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool boxed;

  @override
  Widget build(BuildContext context) {
    final Widget body = Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: boxed
                    ? const TextStyle(
                        fontFamily: AppTypography.manrope,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        height: 24 / 15,
                        color: AppColors.niebla050,
                      )
                    : const TextStyle(
                        fontFamily: AppTypography.manrope,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        height: 22 / 15,
                        color: AppColors.niebla050,
                      ),
              ),
              AppText(subtitle, style: AppTypography.metaSecondary),
            ],
          ),
        ),
        AppSwitch(value: value, onChanged: onChanged),
      ],
    );

    if (!boxed) {
      return SizedBox(width: AppDimensions.controlWidth, child: body);
    }

    return Container(
      width: AppDimensions.controlWidth,
      height: 88,
      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.noche800,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: AppColors.noche600, width: 0.8),
      ),
      child: body,
    );
  }
}
