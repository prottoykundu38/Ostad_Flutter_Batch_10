import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../../../core/models/network_response.dart';
import '../../../../core/services/network_caller.dart';
import '../../../shared/data/models/product_model.dart';

class ProductListController extends GetxController {
  final String tag; // new, special, popular, or categoryId

  ProductListController({required this.tag});

  int _currentPage = 0;
  int? _lastPageNo;
  final int _pageSize = 20;

  bool initialLoading = false;
  bool loading = false;

  final List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<void> fetchProducts() async {
    if (_currentPage > (_lastPageNo ?? 1)) return;

    if (_currentPage == 0) {
      _products.clear();
      initialLoading = true;
    } else {
      loading = true;
    }
    update();

    _currentPage++;

    final url = Urls.productList(_currentPage, _pageSize, tag);
    print("Fetching products for tag=$tag, URL=$url");

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: url);

    if (response.isSuccess) {
      _lastPageNo = response.body!['data']['last_page'];
      List<ProductModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        list.add(ProductModel.fromJson(jsonData));
      }
      _products.addAll(list);
      print("Products fetched for tag=$tag: ${_products.length}");
    } else {
      print("Failed to fetch products for tag=$tag, error: ${response.errorMessage}");
    }

    initialLoading = false;
    loading = false;
    update();
  }

  void refreshProducts() {
    _currentPage = 0;
    fetchProducts();
  }
}
