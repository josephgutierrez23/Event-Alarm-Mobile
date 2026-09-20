import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/typography.dart';
import 'app_text.dart';

class DayChip extends StatelessWidget {
  const DayChip({
    super.key,
    required this.label,
    required this.selected,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.dayChip,
        height: AppDimensions.dayChip,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.amanecer500 : AppColors.noche800,
          shape: BoxShape.circle,
          border: selected
              ? null
              : Border.all(color: AppColors.noche600, width: 0.8),
        ),
        child: AppText(
          label,
          style: AppTypography.label.copyWith(
            fontWeight: FontWeight.w600,
            color: selected ? AppColors.noche950 : AppColors.niebla200,
            letterSpacing: 0,
            height: 1,
          ),
        ),
      ),
    );
  }
}
