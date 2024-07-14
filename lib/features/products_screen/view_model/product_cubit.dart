

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/model/product_response.dart';
import '../data/repos/product_repo/product_repo.dart';

part 'product_state.dart';
@Injectable()
class ProductCubit extends Cubit<ProductState> {
  final ProductRepo repo;
  List<Products> allProducts = [];
  List<Products> filteredProducts = [];
  TextEditingController controller = TextEditingController();


  ProductCubit(this.repo) : super(ProductInitial());

  Future<void> loadProductList() async {
    emit(ProductLoading());
    try {
      ProductResponse productResponse = await repo.loadProductList();
      allProducts = productResponse.products ?? [];
      filteredProducts = allProducts;
      emit(ProductSuccess(productResponse: productResponse));
    } catch (e) {
      emit(ProductFailure(error: e.toString()));
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts = allProducts;
    } else {
      filteredProducts = allProducts
          .where((product) =>
      product.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    }
    emit(ProductSearchSuccess(filteredProducts));
  }
}

