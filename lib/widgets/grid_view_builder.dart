import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/product.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          ProductModel product = products[index];
          return Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Product(
              image: product.image,
              title: product.title,
              id: product.id,
              product: product,
            ),
          );
        },
      ),
    );
  }
}
