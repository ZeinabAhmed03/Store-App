part of 'products_cubit.dart';

abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsLoading extends ProductsState {}
final class ProductsSuccess extends ProductsState {
  final ProductList products;

  ProductsSuccess({required this.products});
}
final class ProductsFailed extends ProductsState {
  final String message;

  ProductsFailed({required this.message});
}
