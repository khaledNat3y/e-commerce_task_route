import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../model/product_response.dart';

class ProductRemoteDataSource {
  final Dio _dio = Dio();

  Future<ProductResponse> loadProductList() async {
    try {
      Response response = await _dio.get("https://dummyjson.com/products");

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        ProductResponse productResponse = ProductResponse.fromJson(response.data);
        return productResponse;
      } else {
        throw Exception('Something went wrong. Please try again later.');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
