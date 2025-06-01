import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/Product_details_view.dart';
import 'package:store_app/widgets/card_item.dart';

class Product extends StatelessWidget {
  const Product(
      {super.key,
      required this.image,
      required this.title,
      required this.id,
      required this.product});

  final String image;
  final String title;
  final int id;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsView(product: product),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  spreadRadius: 20,
                  color: Colors.grey.withOpacity(.1),
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: CardItem(
              title: title,
              id: id,
              product: product,
            ),
          ),
          Positioned(
            top: -70,
            right: 25,
            child: Image.network(height: 100, width: 100, image),
          ),
        ],
      ),
    );
  }
}
