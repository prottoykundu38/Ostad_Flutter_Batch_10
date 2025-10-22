import 'package:e_commerce_app/app/app.dart';
import 'package:e_commerce_app/app/utils/app_version_service.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup Firebase Crashlytics error handling
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Check current app version
  await AppVersionService.getCurrentAppVersion();

  // Run the app with DevicePreview (disabled in release mode)
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable only in debug/profile mode
      builder: (context) => const CraftyBay(), // Your main app widget
    ),
  );
}
