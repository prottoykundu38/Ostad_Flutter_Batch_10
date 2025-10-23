import 'package:e_commerce_app/app/app_theme.dart';
import 'package:e_commerce_app/app/controller/language_cotroller.dart';
import 'package:e_commerce_app/app/controller_binder.dart';
import 'package:e_commerce_app/app/utils/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  static const String name = '/';
  static final LanguageCotroller languageCotroller = LanguageCotroller();

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CraftyBay.languageCotroller,
      builder: (languageCotroller) {
        return GetMaterialApp(
          // DevicePreview removed — use language controller locale and default builder
          useInheritedMediaQuery: true,
          locale: languageCotroller.currentLocale,

          // Localization setup
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          navigatorObservers: [observer],
          supportedLocales: languageCotroller.supportedLocales,
          theme: AppTheme.lightThemeData,
          // darkTheme: AppTheme.darkThemeData,
          themeMode: ThemeMode.dark,
          home: const SplashScreen(),
          initialRoute: SplashScreen.name,
          onGenerateRoute: onGenerateRoute,
          initialBinding: ControllerBinding(),
        );
      },
    );
  }
}
