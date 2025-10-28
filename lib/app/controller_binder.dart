import 'package:e_commerce_app/app/set_up_network_client.dart';
import 'package:e_commerce_app/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavController());
    Get.put(setUpNetworkClient());
  }
}
