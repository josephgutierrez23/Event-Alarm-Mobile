import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../atoms/app_icon.dart';

class AppFab extends StatelessWidget {
  const AppFab({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.fabSize,
        height: AppDimensions.fabSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.amanecer500,
          borderRadius: BorderRadius.circular(AppRadii.fab),
          boxShadow: const [
            BoxShadow(
              color: AppColors.fabShadow,
              offset: Offset(0, 8),
              blurRadius: 8,
            ),
          ],
        ),
        child: const AppIcon(AppAssets.plus, size: 24),
      ),
    );
  }
}
