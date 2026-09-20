import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../atoms/app_text.dart';

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({
    super.key,
    required this.time,
    this.period,
    this.style,
    this.periodStyle,
  });

  final String time;
  final String? period;
  final TextStyle? style;
  final TextStyle? periodStyle;

  @override
  Widget build(BuildContext context) {
    if (period == null) {
      return AppText(time, style: style ?? AppTypography.clockL);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(time, style: style ?? AppTypography.clockS),
        const SizedBox(width: 28),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: AppText(
            period!,
            style:
                periodStyle ??
                AppTypography.meta.copyWith(color: AppColors.niebla400),
          ),
        ),
      ],
    );
  }
}
