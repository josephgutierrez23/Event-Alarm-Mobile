import 'dart:ui';

import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_icon.dart';
import '../atoms/app_text.dart';

class SnoozeControl extends StatelessWidget {
  const SnoozeControl({super.key, required this.onActivated});

  final VoidCallback onActivated;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onActivated,
      onHorizontalDragEnd: (_) => onActivated(),
      child: SizedBox(
        width: AppDimensions.controlWidth,
        height: AppDimensions.snoozeHeight,
        child: CustomPaint(
          painter: const _DashedRRectPainter(),
          child: Stack(
            children: [
              const Align(
                child: AppText(
                  'Desliza para posponer',
                  style: TextStyle(
                    fontFamily: AppTypography.manrope,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 20 / 14,
                    color: AppColors.niebla200,
                  ),
                ),
              ),
              Positioned(
                left: 7,
                top: 12,
                child: Container(
                  width: AppDimensions.snoozeThumb,
                  height: AppDimensions.snoozeThumb,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.amanecer500,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.snoozeShadow,
                        offset: Offset(0, 6),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: const AppIcon(AppAssets.snoozeGlyph, size: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedRRectPainter extends CustomPainter {
  const _DashedRRectPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(AppRadii.snooze),
    );
    final Paint fill = Paint()..color = AppColors.noche700;
    canvas.drawRRect(rrect, fill);

    final Paint stroke = Paint()
      ..color = AppColors.noche600
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    final Path path = Path()..addRRect(rrect);
    const double dash = 5;
    const double gap = 4;
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final double next = (distance + dash).clamp(0, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), stroke);
        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
