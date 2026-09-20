import 'package:flutter/material.dart';

import '../../design_system/dimensions.dart';
import '../molecules/primary_button.dart';
import '../molecules/snooze_control.dart';

class AlarmRingingActions extends StatelessWidget {
  const AlarmRingingActions({
    super.key,
    required this.onSnooze,
    required this.onDismiss,
  });

  final VoidCallback onSnooze;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.controlWidth,
      height: 144,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SnoozeControl(onActivated: onSnooze),
          ),
          Positioned(
            left: 0,
            top: 96,
            child: PrimaryButton(label: 'Apagar alarma', onPressed: onDismiss),
          ),
        ],
      ),
    );
  }
}
