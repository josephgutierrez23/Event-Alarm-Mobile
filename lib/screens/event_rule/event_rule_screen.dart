import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../shared/design_canvas.dart';
import '../../widgets/atoms/app_text.dart';
import '../../widgets/atoms/gesture_pill.dart';
import '../../widgets/molecules/event_option.dart';
import '../../widgets/molecules/primary_button.dart';
import '../../widgets/atoms/section_overline.dart';
import '../../widgets/organisms/mobile_top_bar.dart';

class EventRuleScreen extends StatefulWidget {
  const EventRuleScreen({super.key});

  @override
  State<EventRuleScreen> createState() => _EventRuleScreenState();
}

class _EventRuleScreenState extends State<EventRuleScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noche900,
      body: DesignCanvas(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 24,
              child: MobileTopBar(
                title: 'Regla de evento',
                onBack: () => Navigator.pop(context),
                borderColor: AppColors.noche600,
                titleHeight: 28,
              ),
            ),
            const Positioned(
              left: 16,
              top: 143,
              width: 328,
              child: AppText(
                'Elige qué debe ocurrir para que esta alarma reaccione. Solo puedes usar un evento por alarma.',
                style: TextStyle(
                  fontFamily: AppTypography.manrope,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 20 / 14,
                  color: AppColors.niebla200,
                ),
              ),
            ),
            const Positioned(
              left: 16,
              top: 208,
              child: SectionOverline('SI OCURRE ESTE EVENTO'),
            ),
            Positioned(
              left: 16,
              top: 223,
              child: EventOption(
                icon: AppAssets.eventLocation,
                title: 'Ubicación',
                subtitle: 'Cuando llegues o salgas de un lugar',
                selected: _selected == 0,
                height: 72,
                onTap: () => setState(() => _selected = 0),
              ),
            ),
            Positioned(
              left: 16,
              top: 307,
              child: EventOption(
                icon: AppAssets.eventBluetooth,
                title: 'Dispositivo Bluetooth',
                subtitle: 'Cuando un dispositivo se conecte o se desconecte',
                selected: _selected == 1,
                onTap: () => setState(() => _selected = 1),
              ),
            ),
            Positioned(
              left: 16,
              top: 383,
              child: EventOption(
                icon: AppAssets.eventClimate,
                title: 'Clima',
                subtitle: 'Cuando cambien las condiciones del clima',
                selected: _selected == 2,
                onTap: () => setState(() => _selected = 2),
              ),
            ),
            Positioned(
              left: 16,
              top: 459,
              child: EventOption(
                icon: AppAssets.eventCalendar,
                title: 'Calendario',
                subtitle: 'Cuando se acerque un evento de tu calendario',
                selected: _selected == 3,
                onTap: () => setState(() => _selected = 3),
              ),
            ),
            const Positioned(
              left: 16,
              top: 539,
              width: 328,
              child: AppText(
                'Solo puedes usar un evento por alarma. Quita el evento actual para elegir otro.',
                style: AppTypography.eventOptionSubtitle,
              ),
            ),
            Positioned(
              left: 16,
              top: 632,
              child: PrimaryButton(
                label: 'Continuar',
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Positioned(left: 0, top: 776, child: GesturePill()),
          ],
        ),
      ),
    );
  }
}
