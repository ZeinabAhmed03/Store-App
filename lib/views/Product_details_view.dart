import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              Text(
                product.title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),

              const SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  Text(
                    '${product.price}\$',
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kMainColor),
                  ),
                  const Spacer(),
                  Text(
                    '${product.rating!.rate}',
                    style: const TextStyle(
                      color: kMainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ],
              ),

              const SizedBox(
                height: 7,
              ),
              
              ReadMoreText(
                product.description,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                colorClickableText: kMainColor,
                moreStyle: const TextStyle(fontWeight: FontWeight.bold),
                trimCollapsedText: '...Show more',
                lessStyle: const TextStyle(fontWeight: FontWeight.bold),
                trimExpandedText: '. show less',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
