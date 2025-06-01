import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/grid_view_builder.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 40,
            color: kMainColor,
            fontFamily: kFontFamily,
            fontWeight: FontWeight.bold
          ),
          ),
          centerTitle: true,
      ),

      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if(state is FavoritesInitial){
            return const Center(child: Text('No Products Found'));
          }else if(state is FavoritesLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is FavoritesLoaded){
            List<ProductModel> products = state.product;
            if(products.isNotEmpty){
            return GridViewBuilder(products: products);
           } else if(products.isEmpty) {
            return const Center(child: Text('No Products Found'));
           }       
         }else if(state is FavoritesError){
            return Center(child: Text(state.message),);
          }
          return const Center(child: Text('No Products Found'));
        },
      ),
    );
  }
}