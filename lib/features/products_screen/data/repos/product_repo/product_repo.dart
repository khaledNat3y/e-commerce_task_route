
 import '../../model/product_response.dart';

abstract class ProductRepo {
  Future<ProductResponse> loadProductList();
}
