import 'package:e_commerce_app/app/extensions/localizations_extensions.dart';
import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:e_commerce_app/l10n/app_localizations_bn.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.Localizations.hello),
      ),
    );
  }
}