import 'package:auth_app/features/personalization/controllers/auth_controller.dart';
import 'package:auth_app/features/personalization/screens/main_bottom_nav_screen.dart';
import 'package:auth_app/features/personalization/widgets/bg_widget.dart';
import 'package:auth_app/utils/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'auth/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));

    bool isUserLoggedIn = await AuthController.checkAuthState();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isUserLoggedIn
              ? const MainBottomNavScreen()
              : const SignInScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: SvgPicture.asset(
            AssetPaths.logoSvg,
            width: 150.00,
          ),
        ),
      ),
    );
  }
}
