import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:store_app/models/product_model.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.title,
      required this.id,
      required this.product});
  final String title;
  final int id;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Card(
      clipBehavior: Clip.none,
      elevation: 10,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
                  final isLiked = favoritesCubit.isProductInFavorites(id);
                  return IconButton(
                    onPressed: () {
                      if (isLiked) {
                        favoritesCubit.removeFromFavorites(product);
                      } else {
                        favoritesCubit.addToFavorites(product);
                      }
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.black,
                    ),
                  );
                },
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final isInCart = cartCubit.isProductInCart(id);
                  return IconButton(
                    onPressed: () {
                      if (isInCart) {
                        cartCubit.removeFromCart(product);
                      } else {
                        cartCubit.addToCart(product);
                      }
                    },
                    icon: Icon(
                      isInCart
                          ? Icons.remove_shopping_cart_outlined
                          : Icons.add_shopping_cart,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
