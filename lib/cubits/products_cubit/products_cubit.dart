import 'package:bloc/bloc.dart';
import 'package:store_app/models/product_list.dart';
import 'package:store_app/services/get_all_products_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  void getProducts() async {
   emit(ProductsLoading());
   try {
     ProductList products = await ProductsServices().getAllProducts();
     print(products);
     emit(ProductsSuccess(products: products));
   } catch (e) {
    print(e);
    emit(ProductsFailed(message: 'There Was A Problem Loading The Product, Try Later'));
   }
  }
}
