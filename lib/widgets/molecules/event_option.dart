import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_icon.dart';
import '../atoms/app_text.dart';
import '../atoms/status_dot.dart';

class EventOption extends StatelessWidget {
  const EventOption({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
    this.height = 64,
  });

  final String icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 328,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.noche800,
          borderRadius: BorderRadius.circular(AppRadii.md),
          border: Border.all(
            color: selected ? AppColors.live : AppColors.noche600,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            AppIcon(icon, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    style: AppTypography.eventOptionTitle.copyWith(
                      color: selected ? AppColors.live : AppColors.niebla050,
                    ),
                  ),
                  AppText(
                    subtitle,
                    style: AppTypography.eventOptionSubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (selected)
              Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.noche700,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.noche600, width: 0.8),
                ),
                child: const StatusDot(size: 6),
              ),
          ],
        ),
      ),
    );
  }
}
