import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';

class ChallengeStepSlider extends StatelessWidget {
  const ChallengeStepSlider({
    super.key,
    required this.fillWidth,
    required this.onFillChanged,
  });

  static const double trackWidth = AppDimensions.controlWidth;
  static const double trackHeight = 4;
  static const double thumbSize = 20;
  static const double figmaFill = 108.233;
  static const double figmaThumbLeft = 98.23;

  final double fillWidth;
  final ValueChanged<double> onFillChanged;

  @override
  Widget build(BuildContext context) {
    final double fill = fillWidth.clamp(0, trackWidth);
    final double thumbLeft = (fillWidth - figmaFill).abs() < 0.01
        ? figmaThumbLeft
        : (fill - thumbSize / 2).clamp(0, trackWidth - thumbSize);

    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        onFillChanged((fill + details.delta.dx).clamp(0.0, trackWidth));
      },
      onTapDown: (TapDownDetails details) {
        onFillChanged(details.localPosition.dx.clamp(0.0, trackWidth));
      },
      child: SizedBox(
        width: trackWidth,
        height: thumbSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 8,
              child: Container(
                width: trackWidth,
                height: trackHeight,
                decoration: BoxDecoration(
                  color: AppColors.noche600,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 8,
              child: Container(
                width: fill,
                height: trackHeight,
                decoration: BoxDecoration(
                  color: AppColors.niebla400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Positioned(
              left: thumbLeft,
              top: 0,
              child: Container(
                width: thumbSize,
                height: thumbSize,
                decoration: const BoxDecoration(
                  color: AppColors.amanecer500,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
