import 'package:e_commerce_app/app/utils/app_version_service.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/app_logo.dart';
import 'package:e_commerce_app/features/shared/screens/bottom_nav_holder_screen.dart';
import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static var name;

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
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, BottomNavHolderScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(
                height: 12,
              ),
              Text(
                  '${AppLocalizations.of(context)?.version ?? ''} ${AppVersionService.currentAppVersion}'),
            ],
          ),
        ),
      ),
    );
  }
}
