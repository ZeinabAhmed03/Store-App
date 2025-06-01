import 'package:bloc/bloc.dart';
import 'package:store_app/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductModel> cartList = [];
  void cartLoading(){
    emit(CartLoading());
    emit(CartLoaded(products: cartList));
  }

  void addToCart(ProductModel product){
    if(!cartList.contains(product)){
      cartList.add(product);
      emit(CartLoaded(products: cartList));
      print('Item Is added');
    }
  }

  void removeFromCart(ProductModel product){
    if(cartList.contains(product)){
      cartList.remove(product);
      emit(CartLoaded(products: cartList));
      print('Item is Removed');
    }
  }

  bool isProductInCart(int productId){
    return cartList.any((product) => product.id == productId);
  }
}
