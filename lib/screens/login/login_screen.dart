import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../shared/design_canvas.dart';
import '../../widgets/atoms/app_divider.dart';
import '../../widgets/atoms/app_text.dart';
import '../../widgets/atoms/gesture_pill.dart';
import '../../widgets/molecules/app_text_field.dart';
import '../../widgets/molecules/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noche900,
      body: DesignCanvas(
        child: Stack(
          children: [
            const Positioned(
              left: 16,
              top: 56,
              child: AppText('Inicia sesión', style: AppTypography.h1),
            ),
            const Positioned(
              left: 16,
              top: 98,
              width: 328,
              child: AppText(
                'Tus alarmas y tu historial se sincronizan con esta cuenta.',
                style: AppTypography.body,
              ),
            ),
            const Positioned(
              left: 16,
              top: 170,
              child: AppTextField(
                label: 'Correo electrónico',
                hint: 'nombre@universidad.edu.co',
              ),
            ),
            Positioned(
              left: 16,
              top: 242,
              child: AppTextField(
                label: 'Contraseña',
                hint: 'Mínimo 8 caracteres',
                obscureText: _obscure,
                showEye: true,
                onEyeTap: () => setState(() => _obscure = !_obscure),
              ),
            ),
            Positioned(
              left: 16,
              top: 329,
              child: PrimaryButton(
                label: 'Iniciar sesión',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                },
              ),
            ),
            const Positioned(left: 16, top: 719, child: AppDivider()),
            const Positioned(
              left: 16,
              top: 738,
              width: 328,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: AppText(
                  'Al continuar aceptas los Términos de servicio y la Política de privacidad.',
                  style: AppTypography.legal,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
            const Positioned(left: 0, top: 776, child: GesturePill()),
          ],
        ),
      ),
    );
  }
}
