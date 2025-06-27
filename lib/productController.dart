import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Models/productModel.dart';
import 'package:flutter_application_1/utils/url.dart';

class ProductController {
  List<Data> products = [];

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProduct));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(data);
      products = model.data ?? [];
    }
  }

  Future<bool> createUpdateProducts(
    String productName,
    String img,
    int qty,
    int unitPrice,
    int totalPrice,
    bool isUpdate,
    String? productID,
  ) async {
    final response = await http.post(
      Uri.parse(isUpdate ? Urls.updateProduct(productID!) : Urls.createProduct),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode({
        {
          "ProductName": productName,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": img,
          "Qty": qty,
          "UnitPrice": unitPrice,
          "TotalPrice": totalPrice,
        },
      }),
    );

    if (response.statusCode == 201) {
      fetchProducts();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProducts(String productId) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(productId)));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
