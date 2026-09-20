import 'package:flutter/material.dart';

import '../atoms/section_overline.dart';
import 'alarm_card.dart';

class AlarmListEntry {
  const AlarmListEntry({
    required this.top,
    required this.data,
    this.onTap,
    this.onToggle,
  });

  final double top;
  final AlarmCardData data;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggle;
}

class AlarmListSection extends StatelessWidget {
  const AlarmListSection({
    super.key,
    required this.title,
    required this.height,
    required this.entries,
  });

  final String title;
  final double height;
  final List<AlarmListEntry> entries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: height,
      child: Stack(
        children: [
          Positioned(left: 0, top: 0, child: SectionOverline(title)),
          for (final AlarmListEntry entry in entries)
            Positioned(
              left: 0,
              top: entry.top,
              child: AlarmCard(
                data: entry.data,
                onTap: entry.onTap,
                onToggle: entry.onToggle,
              ),
            ),
        ],
      ),
    );
  }
}
