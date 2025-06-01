import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/widgets/category.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 32,
            fontFamily: kFontFamily,
            color: kMainColor,
            fontWeight: FontWeight.bold
          ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Category(
              categoryImage: kWomenClothesLogo, 
              categoryName: 'Women\'s Clothing'),
         
              Category(
              categoryImage: kMenClothesLogo, 
              categoryName: 'Men\'s Clothing'),
        
              Category(
              categoryImage: kJewelleryLogo, 
              categoryName: 'Jewelery'),
        
              Category(
              categoryImage: kElectronicsLogo, 
              categoryName: 'Electronics'),
        
          ],
        ),
      ),

    );
  }
}