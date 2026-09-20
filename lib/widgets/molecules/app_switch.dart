import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../atoms/switch_thumb.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.thumbColor = AppColors.niebla050,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color thumbColor;

  @override
  Widget build(BuildContext context) {
    final Color track = value ? AppColors.amanecer500 : AppColors.noche600;

    return GestureDetector(
      onTap: onChanged == null ? null : () => onChanged!(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        width: AppDimensions.switchWidth,
        height: AppDimensions.switchHeight,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: track,
          borderRadius: BorderRadius.circular(16),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 140),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: SwitchThumb(color: thumbColor),
        ),
      ),
    );
  }
}
