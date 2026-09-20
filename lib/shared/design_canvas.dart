import 'package:flutter/material.dart';

import '../design_system/colors.dart';
import '../design_system/dimensions.dart';

class DesignCanvas extends StatelessWidget {
  const DesignCanvas({
    super.key,
    required this.child,
    this.background = AppColors.noche900,
  });

  final Widget child;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: background,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double scale = constraints.maxWidth / AppDimensions.canvasWidth;
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: constraints.maxWidth,
              height: AppDimensions.canvasHeight * scale,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: AppDimensions.canvasWidth,
                  height: AppDimensions.canvasHeight,
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      size: const Size(
                        AppDimensions.canvasWidth,
                        AppDimensions.canvasHeight,
                      ),
                      textScaler: TextScaler.noScaling,
                      padding: EdgeInsets.zero,
                      viewPadding: EdgeInsets.zero,
                      viewInsets: EdgeInsets.zero,
                    ),
                    child: ColoredBox(color: background, child: child),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
