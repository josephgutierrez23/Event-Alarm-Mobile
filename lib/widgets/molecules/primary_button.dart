import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
          color: AppColors.amanecer500,
          borderRadius: BorderRadius.circular(AppRadii.xxl),
        ),
        child: AppText(label, style: AppTypography.button),
      ),
    );
  }
}
