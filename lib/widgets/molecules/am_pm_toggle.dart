import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../atoms/app_text.dart';

class AmPmToggle extends StatelessWidget {
  const AmPmToggle({super.key, required this.isAm, required this.onChanged});

  final bool isAm;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.amPmWidth,
      height: AppDimensions.amPmHeight,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.noche700,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: AppColors.noche600),
      ),
      child: Row(
        children: [
          _Segment(label: 'a.m.', selected: isAm, onTap: () => onChanged(true)),
          _Segment(
            label: 'p.m.',
            selected: !isAm,
            onTap: () => onChanged(false),
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.amanecer500 : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: AppText(
            label,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              fontSize: 10,
              height: 1,
              color: selected ? AppColors.noche950 : AppColors.niebla200,
            ),
          ),
        ),
      ),
    );
  }
}
