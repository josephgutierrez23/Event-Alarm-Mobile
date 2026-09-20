import 'package:flutter/material.dart';

import '../../design_system/typography.dart';
import 'app_text.dart';

class SectionOverline extends StatelessWidget {
  const SectionOverline(this.label, {super.key, this.color});

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppText(
      label,
      style: color == null
          ? AppTypography.overline
          : AppTypography.overline.copyWith(color: color),
    );
  }
}
