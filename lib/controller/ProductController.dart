import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import '../api/config.dart';
import '../model/Product_Models.dart';

class ProductController extends GetxController {
  String url = Path.requestProduct;
  var product = <Product>[].obs;
  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  void fetchApi() async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var Request = json.decode(response.body);
        product.addAll(
          Request["Message"].map<Product>(
            (json) => Product.fromJson(json),
          ),
        );
      }
    } catch (err) {
      print(err);
    }
  }
}
