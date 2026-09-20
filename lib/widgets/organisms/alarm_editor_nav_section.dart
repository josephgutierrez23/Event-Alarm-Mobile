import 'package:flutter/material.dart';

import '../atoms/section_overline.dart';
import '../molecules/nav_row.dart';
import '../molecules/primary_button.dart';

class AlarmEditorNavSection extends StatelessWidget {
  const AlarmEditorNavSection({
    super.key,
    required this.onSave,
    required this.onOpenEvents,
    required this.onOpenChallenges,
  });

  final VoidCallback onSave;
  final VoidCallback onOpenEvents;
  final VoidCallback onOpenChallenges;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 256,
      child: Stack(
        children: [
          const Positioned(left: 0, top: 0, child: SectionOverline('EVENTOS')),
          Positioned(
            left: 0,
            top: 25,
            child: NavRow(
              title: 'Eventos que activan la alarma',
              onTap: onOpenEvents,
            ),
          ),
          const Positioned(left: 0, top: 95, child: SectionOverline('APAGADO')),
          Positioned(
            left: 0,
            top: 128,
            child: NavRow(
              title: 'Retos para desactivar la alarma',
              onTap: onOpenChallenges,
            ),
          ),
          Positioned(
            left: 0,
            top: 208,
            child: PrimaryButton(label: 'Guardar alarma', onPressed: onSave),
          ),
        ],
      ),
    );
  }
}
