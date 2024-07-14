part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

// Loading state
class ProductLoading extends ProductState{}

// Success state
class ProductSuccess extends ProductState{
  final ProductResponse productResponse;
  ProductSuccess({required this.productResponse});
}

//Failure
class ProductFailure extends ProductState{
  final String error;
  ProductFailure({required this.error});

}