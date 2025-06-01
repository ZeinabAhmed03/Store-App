import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_list.dart';
import 'package:store_app/models/product_model.dart';

class ProductsServices{
  // Get Jewelery Category
   Future<List<ProductModel>> getJeweleryCategory() async{
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/jewelery', token: null);
    List <ProductModel> jeweleryProducts= [];
    for (var item in data) {
      jeweleryProducts.add(ProductModel.fromJson(item));
    }
    return jeweleryProducts;
  }  

   // Get Women's Category
   Future<List<ProductModel>> getWomenCategory() async{
    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products/category/women's clothing", token: null);
    List <ProductModel> womenProducts = [];
    for (var item in data) {
      womenProducts.add(ProductModel.fromJson(item));
    }
    return womenProducts;
  }

  // Get Men's Category
   Future<List<ProductModel>> getMenCategory() async{
    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products/category/men's clothing", token: null);
    List <ProductModel> menProducts = [];
    for (var item in data) {
      menProducts.add(ProductModel.fromJson(item));
    }
    return menProducts;
  } 

  // Get Electronics Category
   Future<List<ProductModel>> getElectronicsCategory() async{
    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products/category/electronics", token: null);
    List <ProductModel> electronicsProducts = [];
    for (var item in data) {
      electronicsProducts.add(ProductModel.fromJson(item));
    }
    return electronicsProducts;
  } 

  // get All Products
  Future <ProductList> getAllProducts()async{    
  try{
    var jeweleryCategory = await getJeweleryCategory();
    var womenCategory = await getWomenCategory();
    var menCategory = await getMenCategory();
    var electronicsCategory = await getElectronicsCategory();
    var allProducts = [ ...womenCategory, ...jeweleryCategory, ...menCategory, ...electronicsCategory];
    return ProductList(
      jeweleryCategory: jeweleryCategory,
      womenCategory: womenCategory,
      menCategory: menCategory,
      electronicsCategory: electronicsCategory,
      allCategories: allProducts
    );
  }catch(e){
    return ProductList();
  }
  }
}