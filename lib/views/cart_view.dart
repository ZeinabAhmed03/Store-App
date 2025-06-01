import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/grid_view_builder.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 40,
            color: kMainColor,
            fontFamily: kFontFamily,
            fontWeight: FontWeight.bold
          ),
          ),
          centerTitle: true,
      ),

      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if(state is CartInitial){
            return const Center(child: Text('No Products Found'));
          }else if(state is CartLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is CartLoaded){
            List<ProductModel> products = state.products;
            if(products.isNotEmpty){
            return GridViewBuilder(products: products);
           } else if(products.isEmpty) {
            return const Center(child: Text('No Products Found'));
           }       
         }else if(state is CartError){
            return Center(child: Text(state.error),);
          }
          return const Center(child: Text('No Products Found'));
        },
      ),
    );
  }
}