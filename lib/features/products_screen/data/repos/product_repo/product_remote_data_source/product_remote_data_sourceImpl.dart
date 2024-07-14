// product_remote_data_source_impl.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/features/products_screen/data/repos/product_repo/product_remote_data_source/product_remote_data_source.dart';
import '../../../model/product_response.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  @override
  Future<ProductResponse> loadProductList() async {
    final Dio dio = Dio();
    try {
      Response response = await dio.get("https://dummyjson.com/products");

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
