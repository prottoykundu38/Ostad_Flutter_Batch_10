import 'package:get/get.dart';
import '../../../shared/data/models/product_model.dart';

class WishListController extends GetxController {
  final List<ProductModel> _wishList = [];
  bool isLoading = false;
  List<ProductModel> get wishList => _wishList;

  bool isInWishList(String id) {
    return _wishList.any((item) => item.id == id);
  }

  void toggleWish(ProductModel product) {
    if (isInWishList(product.id)) {
      _wishList.removeWhere((p) => p.id == product.id);
    } else {
      _wishList.add(product);
    }
    update();
  }
}
