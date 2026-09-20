import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../atoms/app_icon.dart';

class AlarmRingingVisual extends StatelessWidget {
  const AlarmRingingVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.ringBox,
      height: AppDimensions.ringBox,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const AppIcon(AppAssets.ringAccent, size: 200),
          const AppIcon(AppAssets.ringBase, size: 152),
          Container(
            width: AppDimensions.geoPinBox,
            height: AppDimensions.geoPinBox,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.noche800,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.live, width: 0.8),
            ),
            child: const AppIcon(AppAssets.geoPin, size: 22),
          ),
        ],
      ),
    );
  }
}
