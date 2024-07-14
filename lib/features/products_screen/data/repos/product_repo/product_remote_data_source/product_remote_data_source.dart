import '../../../model/product_response.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponse> loadProductList();
}