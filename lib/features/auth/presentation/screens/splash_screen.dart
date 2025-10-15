import 'package:e_commerce_app/app/asset_paths.dart';
import 'package:e_commerce_app/app/extensions/localizations_extensions.dart';
import 'package:e_commerce_app/app/utils/app_version_service.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/language_change_switch.dart';
import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:e_commerce_app/l10n/app_localizations_bn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              SvgPicture.asset(
                Assetpaths.logoSvg,
                width: 120,
              ),
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
