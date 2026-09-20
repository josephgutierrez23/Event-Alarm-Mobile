import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/typography.dart';
import '../atoms/app_icon.dart';
import '../atoms/app_text.dart';

class MobileTopBar extends StatelessWidget {
  const MobileTopBar({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
    this.borderColor = AppColors.noche700,
    this.titleHeight = 30,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;
  final Color borderColor;
  final double titleHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.canvasWidth,
      height: AppDimensions.topBarHeight,
      decoration: BoxDecoration(
        color: AppColors.noche900,
        border: Border(bottom: BorderSide(color: borderColor, width: 1)),
      ),
      child: Stack(
        children: [
          if (onBack != null)
            Positioned(
              left: 16,
              top: 20,
              child: GestureDetector(
                onTap: onBack,
                child: const AppIcon(AppAssets.back, size: 24),
              ),
            ),
          Positioned(
            left: onBack != null ? 56 : 16,
            top: 17,
            child: AppText(
              title,
              style: AppTypography.h2.copyWith(height: titleHeight / 24),
            ),
          ),
          if (trailing != null)
            Positioned(right: 16, top: 12, child: trailing!),
        ],
      ),
    );
  }
}
