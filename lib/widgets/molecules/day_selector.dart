import 'package:flutter/material.dart';

import '../../design_system/dimensions.dart';
import '../atoms/day_chip.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({
    super.key,
    required this.labels,
    required this.selected,
    required this.onChanged,
  });

  final List<String> labels;
  final List<bool> selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.controlWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < labels.length; i++)
            DayChip(
              label: labels[i],
              selected: selected[i],
              onTap: () => onChanged(i),
            ),
        ],
      ),
    );
  }
}
