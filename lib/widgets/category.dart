import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/views/products_category_view.dart';

class Category extends StatelessWidget {
  const Category(
      {super.key, required this.categoryImage, required this.categoryName});
  final String categoryImage;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductsCategoryView(categoryName: categoryName),
            ),
          );
        },
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(categoryImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: const TextStyle(
                  fontSize: 32,
                  fontFamily: kFontFamily,
                  color: kMainColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
