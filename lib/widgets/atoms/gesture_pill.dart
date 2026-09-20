import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';

class GesturePill extends StatelessWidget {
  const GesturePill({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.gestureHeight,
      width: AppDimensions.canvasWidth,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Container(
            width: AppDimensions.gesturePillWidth,
            height: AppDimensions.gesturePillHeight,
            decoration: BoxDecoration(
              color: AppColors.niebla400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}
