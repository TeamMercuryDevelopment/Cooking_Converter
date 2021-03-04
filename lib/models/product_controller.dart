import 'package:cooking_converter/models/product.dart';
import 'package:flutter/material.dart';

class ProductController {
  
  TextEditingController productController = TextEditingController();
  List<Product> products = Product.getProducts();
  List<DropdownMenuItem<Product>> dropdownMenuItems;
  Product selectedProduct;

  List<DropdownMenuItem<Product>> buildDropdownMenuItems (List products) {
    List<DropdownMenuItem<Product>> items = List();
    for(Product product in products) {
      items.add(
        DropdownMenuItem(
          value: product, 
          child: Text(product.name)
        ),
      );
    }
    return items;
  }
}