import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:route_task/features/products_screen/data/repos/product_repo/product_remote_data_source/product_remote_data_sourceImpl.dart';
import 'package:route_task/features/products_screen/data/repos/product_repo/product_repo.dart';

import '../../../../../core/networking/api_errors.dart';
import '../../model/product_response.dart';
@Injectable(as: ProductRepo)
class ProductRepoImpl extends ProductRepo {
  ProductRemoteDataSourceImpl productRemoteDataSource;
  InternetConnectionChecker connectionChecker;
  ProductRepoImpl(this.productRemoteDataSource, this.connectionChecker);

  @override
  Future<ProductResponse> loadProductList() async {
    if(await connectionChecker.hasConnection) {
      ProductResponse response = await productRemoteDataSource.loadProductList();
      return response;
    }else {
      throw ApiErrors.noInternetError;
    }
  }
}