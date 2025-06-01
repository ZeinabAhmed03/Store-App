import 'package:store_app/models/product_model.dart';

class ProductList {
  final List<ProductModel> womenCategory;
  final List<ProductModel>  menCategory;
  final List<ProductModel>  jeweleryCategory;
  final List<ProductModel>  electronicsCategory;
  final List<ProductModel>  allCategories;
  ProductList({
     this.womenCategory = const [], 
     this.menCategory = const [], 
     this.jeweleryCategory = const [], 
     this.electronicsCategory= const [],
     this.allCategories= const [],
     });

  
}