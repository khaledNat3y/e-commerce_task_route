import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/product_response.dart';
import '../data/repos/product_repo/prooduct_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepo repo ;
  ProductCubit(this.repo) : super(ProductInitial());

  Future<void> loadProductList() async {
    emit(ProductLoading());
    try {
      ProductResponse productResponse = await repo.loadProductList();
      emit(ProductSuccess(productResponse: productResponse));
    }catch(e) {
      emit(ProductFailure(error: e.toString()));
      throw e.toString();
    }
  }
}
