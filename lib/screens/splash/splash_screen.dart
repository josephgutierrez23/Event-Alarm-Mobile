import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../design_system/app_assets.dart';
import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../../shared/design_canvas.dart';
import '../../widgets/atoms/app_icon.dart';
import '../../widgets/atoms/app_text.dart';
import '../../widgets/atoms/gesture_pill.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  /// Tiempo en pantalla antes de ir al login. Un tap lo salta.
  static const Duration displayDuration = Duration(milliseconds: 3200);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(SplashScreen.displayDuration, _goToLogin);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goToLogin() {
    if (_navigated || !mounted) return;
    _navigated = true;
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noche900,
      body: DesignCanvas(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _goToLogin,
          child: const Stack(
            children: [
              Positioned(
                left: 132,
                top: 312,
                child: SizedBox(
                  width: AppDimensions.logoSize,
                  height: AppDimensions.logoSize,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.amanecer500,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppRadii.logo),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 22, 13, 22),
                      child: AppIcon(
                        AppAssets.brandMark,
                        size: 66,
                        color: AppColors.noche950,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 432,
                child: AppText(
                  'Alarma contextual',
                  style: AppTypography.splashTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                top: 474,
                child: AppText(
                  'Despierta con el contexto, no solo con la hora',
                  style: AppTypography.splashSubtitle,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
              Positioned(
                left: 164,
                top: 700,
                child: AppIcon(
                  AppAssets.loadingRing,
                  size: AppDimensions.splashRing,
                ),
              ),
              Positioned(left: 0, top: 776, child: GesturePill()),
            ],
          ),
        ),
      ),
    );
  }
}
