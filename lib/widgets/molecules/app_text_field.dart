import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_icon.dart';
import '../atoms/app_text.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.obscureText = false,
    this.showEye = false,
    this.onEyeTap,
    this.width = AppDimensions.controlWidth,
    this.height = AppDimensions.fieldHeight,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final bool showEye;
  final VoidCallback? onEyeTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.noche800,
                borderRadius: BorderRadius.circular(AppRadii.md),
                border: Border.all(color: AppColors.noche600, width: 1),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: showEye ? 48 : 16,
            top: 16,
            bottom: 8,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                cursorColor: AppColors.amanecer500,
                style: AppTypography.fieldValue,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: AppTypography.fieldHint,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          if (showEye)
            Positioned(
              right: 12,
              top: 16,
              child: GestureDetector(
                onTap: onEyeTap,
                child: const AppIcon(AppAssets.eye, size: 24),
              ),
            ),
          Positioned(
            left: 12,
            top: -8,
            child: ColoredBox(
              color: AppColors.noche800,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AppText(label, style: AppTypography.fieldLabel),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
