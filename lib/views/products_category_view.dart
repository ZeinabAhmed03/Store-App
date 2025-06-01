import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/grid_view_builder.dart';

class ProductsCategoryView extends StatelessWidget {
  const ProductsCategoryView({super.key, required this.categoryName,});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ProductsCubit>(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryName,
            style: const TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.bold,
              color: kMainColor,
              fontSize: 32
            ),
            ),
            centerTitle: true,
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if(state is ProductsLoading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is ProductsSuccess){
              
              if (categoryName == 'Women\'s Clothing'){
                List<ProductModel> products = state.products.womenCategory;
                return GridViewBuilder(products: products);
              }else if(categoryName == 'Men\'s Clothing'){
                List<ProductModel> products = state.products.menCategory;
                return GridViewBuilder(products: products);
              }else if(categoryName == 'Jewelery'){
                List<ProductModel> products = state.products.jeweleryCategory;
                return GridViewBuilder(products: products);
              }else if(categoryName == 'Electronics'){
                List<ProductModel> products = state.products.electronicsCategory;
                return GridViewBuilder(products: products);
              }
            }else if(state is ProductsFailed){
              return Center(child: Text(state.message),);
            }else{
              return const Center(child: Text('Error Loading Please Try Later'),);
            }
            return const SizedBox();
          },
        ),
      
      ),
    );
  }
}