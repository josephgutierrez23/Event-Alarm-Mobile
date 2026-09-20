import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';

class VolumeSlider extends StatelessWidget {
  const VolumeSlider({super.key, required this.value, required this.onChanged});

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        final double next =
            (value + details.delta.dx / AppDimensions.controlWidth).clamp(
              0.0,
              1.0,
            );
        onChanged(next);
      },
      onTapDown: (TapDownDetails details) {
        onChanged(
          (details.localPosition.dx / AppDimensions.controlWidth).clamp(
            0.0,
            1.0,
          ),
        );
      },
      child: SizedBox(
        width: AppDimensions.controlWidth,
        height: 20,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: AppDimensions.controlWidth,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.noche600,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Container(
              width: AppDimensions.controlWidth * value,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.amanecer500,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Positioned(
              left: (AppDimensions.controlWidth - 12) * value,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.noche950,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.amanecer500, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
