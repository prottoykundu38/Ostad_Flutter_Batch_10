import 'package:e_commerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:e_commerce_app/features/shared/screens/bottom_nav_holder_screen.dart';
import 'package:flutter/material.dart';

MaterialPageRoute onGenerateRoute(
  RouteSettings setting,
) {
  late Widget screen;

  if (setting.name == SplashScreen.name) {
    screen = SplashScreen();
  } else if (setting.name == SignInScreen.name) {
    screen = SignInScreen();
  } else if (setting.name == SignUpScreen.name) {
    screen = SignUpScreen();
  } else if (setting.name == VerifyOtpScreen.name) {
    screen = VerifyOtpScreen();
  } else if (setting.name == BottomNavHolderScreen.name) {
    screen = BottomNavHolderScreen();
  }

  return MaterialPageRoute(builder: (ctx) => screen);
}
