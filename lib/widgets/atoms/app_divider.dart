import 'package:flutter/material.dart';

import '../../design_system/colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color = AppColors.noche700});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: const SizedBox(width: 328, height: 1),
    );
  }
}
