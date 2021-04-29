import 'package:cooking_converter/models/product.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

class ProductRepository {
  Future<List<Product>> getProducts() async {
    final response =
        await rootBundle.loadString("assets/database/json/ingredients.json");
    final serialized = JsonMapper.serialize(response);
    final list = JsonMapper.deserialize<List<Object>>(serialized);
    final productList = list.map((e) => Product.fromMap(e)).toList();
    return productList.asObservable();
  }
}
