import 'package:cooking_converter/models/product.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final TextEditingController controller;
  final Function onChange;
  final List<DropdownMenuItem<Product>> dropdownMenuItems;
  final Product selectedProduct;

  ListProduct({
    this.controller,
    this.selectedProduct,
    this.dropdownMenuItems,
    this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: [
            Text('Select one item'),
            DropdownButton(
              value: selectedProduct,
              items: dropdownMenuItems,
              onChanged: onChange,
            ),
          ],
        ),
      ),
    );
  }
}
