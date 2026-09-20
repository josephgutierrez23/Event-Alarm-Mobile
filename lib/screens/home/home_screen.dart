import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/spacing.dart';
import '../../shared/design_canvas.dart';
import '../../widgets/atoms/app_icon.dart';
import '../../widgets/atoms/gesture_pill.dart';
import '../../widgets/molecules/app_fab.dart';
import '../../widgets/organisms/alarm_card.dart';
import '../../widgets/organisms/alarm_list_section.dart';
import '../../widgets/organisms/mobile_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<AlarmCardData> _active = <AlarmCardData>[
    const AlarmCardData(
      time: '06:15',
      period: 'a. m.',
      title: 'Parcial de Cálculo · Lun Mié Vie',
      dots: <String>[AppAssets.signalDot3, AppAssets.signalDot1],
    ),
    const AlarmCardData(
      isEvent: true,
      title: 'Al llegar a Calle 45',
      subtitle: 'Sin hora fija · En espera',
      dots: <String>[AppAssets.signalDot2, AppAssets.signalDot1],
    ),
    const AlarmCardData(
      time: '05:30',
      period: 'a. m.',
      title: 'Turno de domingo · Dom',
      dots: <String>[
        AppAssets.signalDot1,
        AppAssets.signalDot2,
        AppAssets.signalDot2,
        AppAssets.signalDot3,
      ],
    ),
  ];

  AlarmCardData _inactive = const AlarmCardData(
    time: '09:00',
    period: 'p. m.',
    title: 'Recordar tomar agua · Todos los días',
    enabled: false,
    dots: <String>[AppAssets.signalDot1, AppAssets.signalDot2],
  );

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
                title: 'Mis alarmas',
                trailing: Container(
                  width: AppDimensions.profileSize,
                  height: AppDimensions.profileSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.noche800,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.noche600, width: 0.8),
                  ),
                  child: const AppIcon(AppAssets.profile, size: 22),
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.screen,
              top: 118,
              child: AlarmListSection(
                title: 'ALARMAS ACTIVAS',
                height: 376,
                entries: <AlarmListEntry>[
                  AlarmListEntry(
                    top: 32,
                    data: _active[0],
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.alarmRinging),
                    onToggle: (bool value) => setState(() {
                      _active[0] = _active[0].copyWith(enabled: value);
                    }),
                  ),
                  AlarmListEntry(
                    top: 148,
                    data: _active[1],
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.alarmRinging),
                    onToggle: (bool value) => setState(() {
                      _active[1] = _active[1].copyWith(enabled: value);
                    }),
                  ),
                  AlarmListEntry(
                    top: 264,
                    data: _active[2],
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.alarmRinging),
                    onToggle: (bool value) => setState(() {
                      _active[2] = _active[2].copyWith(enabled: value);
                    }),
                  ),
                ],
              ),
            ),
            Positioned(
              left: AppSpacing.screen,
              top: 504,
              child: AlarmListSection(
                title: 'ALARMAS DESACTIVADAS',
                height: 138,
                entries: <AlarmListEntry>[
                  AlarmListEntry(
                    top: 26,
                    data: _inactive,
                    onToggle: (bool value) => setState(() {
                      _inactive = _inactive.copyWith(enabled: value);
                    }),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 286,
              top: 665,
              child: AppFab(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.alarmEditor),
              ),
            ),
            const Positioned(left: 0, top: 776, child: GesturePill()),
          ],
        ),
      ),
    );
  }
}
