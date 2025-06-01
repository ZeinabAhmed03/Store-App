part of 'favorites_cubit.dart';

abstract class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesLoading extends FavoritesState {}
final class FavoritesLoaded extends FavoritesState {
  final List<ProductModel> product;

  FavoritesLoaded({required this.product});
}
final class FavoritesAdded extends FavoritesState {
  final List<ProductModel> product;

  FavoritesAdded({required this.product});
}
final class FavoritesRemoved extends FavoritesState {
  final List<ProductModel> product;

  FavoritesRemoved({required this.product});
}
final class FavoritesError extends FavoritesState {
  String message = 'Error Loading Your Favorites';
}
