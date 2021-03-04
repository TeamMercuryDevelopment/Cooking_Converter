import 'package:cooking_converter/models/product.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos')
      ),
      body: ListView.builder(
        itemCount: Product.getProducts().length,
        itemBuilder: (context, index){
          final Product product = Product.getProducts().elementAt(index);
          return ProductItem(product);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product _product;

  ProductItem(this._product);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_product.name.toString()),
          
        ))
        ;
  }
}