import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:route_task/features/products_screen/data/repos/product_repo/product_remote_data_source/product_remote_data_source.dart';

import '../../model/product_response.dart';

class ProductRepo {
  ProductRemoteDataSource productRemoteDataSource;
  InternetConnectionChecker connectionChecker;
  ProductRepo(this.productRemoteDataSource, this.connectionChecker);

  Future<ProductResponse> loadProductList() async {
    if(await connectionChecker.hasConnection) {
      ProductResponse response = await productRemoteDataSource.loadProductList();
      return response;
    }else {
      throw "No Internet Connection";
    }
  }
}