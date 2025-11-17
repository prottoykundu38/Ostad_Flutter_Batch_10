import 'package:e_commerce_app/app/controller/auth_controller.dart';
import 'package:e_commerce_app/app/set_up_network_client.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/controllers/logIn_controller.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/controllers/sign_up_controller.dart';
import 'package:e_commerce_app/features/home/presentation/controller/home_slider_controller.dart';
import 'package:e_commerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:get/get.dart';
import '../features/auth/presentation/screens/widgets/verify_otp_controller.dart';
import '../features/shared/presentation/controllers/category_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(MainNavController());
    Get.put(CategoryController());
    Get.put(setUpNetworkClient());
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
    Get.put(LoginController());
    Get.put(HomeSliderController());
    
  }
}
