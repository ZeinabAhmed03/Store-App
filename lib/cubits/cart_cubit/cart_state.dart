part of 'cart_cubit.dart';

abstract class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartLoaded extends CartState {
  final List<ProductModel> products;

  CartLoaded({required this.products});
}
final class CartAdded extends CartState {
  final List<ProductModel> products;

  CartAdded({required this.products});
}
final class CartRemoved extends CartState {
  final List<ProductModel> products;

  CartRemoved({required this.products});
}
final class CartError extends CartState {
  final String error = 'There Was a Problem Loading Your Cart';  
}
