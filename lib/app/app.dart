import 'package:e_commerce_app/app/app_theme.dart';
import 'package:e_commerce_app/app/controller/language_cotroller.dart';
import 'package:e_commerce_app/app/controller_binder.dart';
import 'package:e_commerce_app/app/utils/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final LanguageCotroller languageController = LanguageCotroller();

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CraftyBay.languageController,
      builder: (languageController) {
        return GetMaterialApp(
          navigatorKey: CraftyBay.navigatorKey,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorObservers: [observer],
          locale: languageController.currentLocale,
          supportedLocales: languageController.supportedLocales,
          theme: AppTheme.lightThemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode: ThemeMode.light,
          home: SplashScreen(),
          initialRoute: '/',
          onGenerateRoute: onGenerateRoute,
          initialBinding: ControllerBinding(),
        );
      },
    );
  }
}
