import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:route_task/features/products_screen/data/repos/product_repo/product_remote_data_source/product_remote_data_sourceImpl.dart';

@module
abstract class ThirdPartyPackagesModule {
  InternetConnectionChecker get provideInternetConnectionChecker
  => InternetConnectionChecker();

  ProductRemoteDataSourceImpl get provideProductRemoteDataSourceImpl
  => ProductRemoteDataSourceImpl();
}