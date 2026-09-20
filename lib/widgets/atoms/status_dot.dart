import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import 'app_icon.dart';

class StatusDot extends StatelessWidget {
  const StatusDot({super.key, this.size = 8});

  final double size;

  @override
  Widget build(BuildContext context) {
    return AppIcon(AppAssets.statusDot, size: size);
  }
}
