import 'package:bloc/bloc.dart';
import 'package:store_app/models/product_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  List <ProductModel> favorites = [];
  
  void favoritesLoading(){
    emit(FavoritesLoading());
    emit(FavoritesLoaded(product: favorites));
  }
  void addToFavorites(ProductModel product){
    if(!favorites.contains(product)){
      favorites.add(product);
      emit(FavoritesLoaded(product: favorites));
      print('Item is Added' );
    }
  }

  void removeFromFavorites(ProductModel product){
    if(favorites.contains(product)){
      favorites.remove(product);
      emit(FavoritesLoaded(product: favorites));
      print('Item is Removed');
    }

  }
  bool isProductInFavorites(productId){
    return favorites.any((product)=> product.id == productId);
  } 


}
