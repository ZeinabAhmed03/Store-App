import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/grid_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

     if (context.read<ProductsCubit>().state is! ProductsSuccess) {
        context.read<ProductsCubit>().getProducts();
      }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trending',
          style: TextStyle(
            color: kMainColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: kFontFamily,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
           if(state is ProductsLoading){
            return const Center(child: CircularProgressIndicator(),);
           }else if(state is ProductsSuccess){
            List<ProductModel> products = state.products.allCategories;
            return GridViewBuilder(products: products);
           }else if(state is ProductsFailed){
            return Center(child: Text(state.message),);
           }else{
            return const SizedBox();
           }
          },
        ),
      ),
    );
  }
}

