import 'package:e_commerce_app/app/app.dart';
import 'package:e_commerce_app/app/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/services/network_caller.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';

NetworkCaller setUpNetworkClient() {
  return NetworkCaller(
    onUnAuthorize: _onUnAuthorize,
    accessToken: () {
      return Get.find<AuthController>().accessToken ?? '';
    },
  );
}

Future<void> _onUnAuthorize() async {
  // TODO: remove cache
  Navigator.pushNamedAndRemoveUntil(
    CraftyBay.navigatorKey.currentContext!,
    SignInScreen.name,
    (predicate) => false,
  );
}
