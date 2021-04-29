import 'package:cooking_converter/models/product.dart';
import 'package:cooking_converter/repositories/product_repository.dart';
import 'package:cooking_converter/screens/form.dart';
import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:dart_json_mapper_mobx/dart_json_mapper_mobx.dart'
    show mobXAdapter;

import 'main.reflectable.dart' show initializeReflectable;

void main() async {
  initializeReflectable();
  WidgetsFlutterBinding.ensureInitialized();
  JsonMapper().useAdapter(mobXAdapter);
  runApp(CookingConverterApp());
}

class CookingConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ProductForm(),
    );
  }
}
