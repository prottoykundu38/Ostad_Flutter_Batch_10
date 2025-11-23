import 'package:e_commerce_app/app/urls.dart';
import 'package:e_commerce_app/core/models/network_response.dart';
import 'package:e_commerce_app/core/services/network_caller.dart';
import 'package:e_commerce_app/features/shared/data/models/product_details_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getproductDetailsInProgress = false;
  ProductDetailsModel? _productDetailsModel;
  bool get getproductDetailsInProgress => _getproductDetailsInProgress;
  String? _errorMessage;
  ProductDetailsModel? get productDetails => _productDetailsModel;
  String? get errorMessage => _errorMessage;

  Future<bool> getproductDetails(String productId) async {
    bool isSuccess = false;
    _getproductDetailsInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productDetailsUrl(productId));
    if (response.isSuccess) {
      _productDetailsModel =
          ProductDetailsModel.fromJson(response.body!['data']);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getproductDetailsInProgress = false;
    update();
    return isSuccess;
  }
}
