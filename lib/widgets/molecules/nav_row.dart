import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_icon.dart';
import '../atoms/app_text.dart';

class NavRow extends StatelessWidget {
  const NavRow({
    super.key,
    required this.title,
    this.trailingLabel,
    this.onTap,
    this.boxed = true,
  });

  final String title;
  final String? trailingLabel;
  final VoidCallback? onTap;
  final bool boxed;

  @override
  Widget build(BuildContext context) {
    final Widget row = Row(
      children: [
        Expanded(
          child: AppText(
            title,
            style: const TextStyle(
              fontFamily: AppTypography.manrope,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              height: 22 / 15,
              color: AppColors.niebla050,
            ),
          ),
        ),
        if (trailingLabel != null) ...[
          AppText(
            trailingLabel!,
            style: const TextStyle(
              fontFamily: AppTypography.manrope,
              fontWeight: FontWeight.w500,
              fontSize: 13,
              height: 18 / 13,
              color: AppColors.amanecer500,
            ),
          ),
          const SizedBox(width: 4),
        ],
        const AppIcon(AppAssets.chevron, size: 24),
      ],
    );

    final Widget child = boxed
        ? Container(
            width: AppDimensions.controlWidth,
            height: AppDimensions.fieldHeight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.noche800,
              borderRadius: BorderRadius.circular(AppRadii.md),
              border: Border.all(color: AppColors.noche600),
            ),
            child: row,
          )
        : SizedBox(
            width: AppDimensions.controlWidth,
            height: AppDimensions.fieldHeight,
            child: row,
          );

    if (onTap == null) return child;
    return GestureDetector(onTap: onTap, child: child);
  }
}
