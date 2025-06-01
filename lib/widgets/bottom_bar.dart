import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/views/cart_view.dart';
import 'package:store_app/views/categories_view.dart';
import 'package:store_app/views/favorites_view.dart';
import 'package:store_app/views/home_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  void onTappeddIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  static const List<Widget> pages = <Widget>[
    HomeView(),
    FavoritesView(),
    CartView(),
   CategoriesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kMainColor,
        unselectedItemColor: Colors.grey,
        onTap: onTappeddIndex,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Categories',
          ),
        ],
      ),
    );
  }
}

