import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_text.dart';

class OutlinedActionButton extends StatelessWidget {
  const OutlinedActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: AppDimensions.controlWidth,
        height: AppDimensions.buttonHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadii.xxl),
          border: Border.all(color: AppColors.amanecer500, width: 0.8),
        ),
        child: AppText(
          label,
          style: const TextStyle(
            fontFamily: AppTypography.manrope,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: 0.14,
            color: AppColors.amanecer500,
          ),
        ),
      ),
    );
  }
}
