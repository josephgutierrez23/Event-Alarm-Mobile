import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_icon.dart';
import '../atoms/app_text.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    required this.selected,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String iconAsset;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 156,
        height: 140,
        decoration: BoxDecoration(
          color: selected ? AppColors.noche700 : AppColors.noche800,
          borderRadius: BorderRadius.circular(AppRadii.lg),
          border: Border.all(
            color: selected ? AppColors.amanecer500 : AppColors.noche600,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Stack(
          children: [
            Positioned(left: 62, top: 24, child: AppIcon(iconAsset, size: 32)),
            Positioned(
              left: 0,
              right: 0,
              top: 80,
              child: AppText(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.manrope,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 24 / 16,
                  color: selected ? AppColors.amanecer500 : AppColors.niebla050,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 106,
              child: AppText(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTypography.eventOptionSubtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
