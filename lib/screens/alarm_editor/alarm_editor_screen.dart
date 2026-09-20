import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../shared/design_canvas.dart';
import '../../widgets/atoms/gesture_pill.dart';
import '../../widgets/organisms/alarm_editor_content.dart';
import '../../widgets/organisms/mobile_top_bar.dart';

class AlarmEditorScreen extends StatefulWidget {
  const AlarmEditorScreen({super.key});

  @override
  State<AlarmEditorScreen> createState() => _AlarmEditorScreenState();
}

class _AlarmEditorScreenState extends State<AlarmEditorScreen> {
  bool _isAm = true;
  bool _eventDriven = false;
  bool _conviviality = true;
  double _volume = 196.8 / 328;
  final List<bool> _days = <bool>[false, true, true, false, false, true, false];
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Parcial de Cálculo');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noche900,
      body: DesignCanvas(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.statusBarHeight),
            MobileTopBar(
              title: 'Configurar alarma',
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: AlarmEditorContent(
                  isAm: _isAm,
                  eventDriven: _eventDriven,
                  conviviality: _conviviality,
                  volume: _volume,
                  days: _days,
                  nameController: _nameController,
                  onAmChanged: (bool value) => setState(() => _isAm = value),
                  onEventDrivenChanged: (bool value) =>
                      setState(() => _eventDriven = value),
                  onConvivialityChanged: (bool value) =>
                      setState(() => _conviviality = value),
                  onVolumeChanged: (double value) =>
                      setState(() => _volume = value),
                  onDayChanged: (int index) =>
                      setState(() => _days[index] = !_days[index]),
                  onSave: () => Navigator.pop(context),
                  onOpenEvents: () =>
                      Navigator.pushNamed(context, AppRoutes.eventRule),
                  onOpenChallenges: () =>
                      Navigator.pushNamed(context, AppRoutes.challengeSelector),
                ),
              ),
            ),
            const GesturePill(),
          ],
        ),
      ),
    );
  }
}
