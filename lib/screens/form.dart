import 'package:cooking_converter/controller/convert_to_controller.dart';
import 'package:cooking_converter/controller/product_controller.dart';
import 'package:cooking_converter/controller/conversion_controller.dart';
import 'package:cooking_converter/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  int _currentIndex = 0;

  String productValue;
  String convertFromValue;
  String convertToValue;
  String quantityValue;
  final productController = ProductController();
  final convertToController = ConvertToController();
  final convertFromController = ConvertToController();
  final quantityController = ConversionController();

  @override
  void initState() {
    productController.fetchProducts();
    convertToController.fetchMeasures();
    convertFromController.fetchMeasures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cooking Converter"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Converter",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review_rounded),
            label: "Rate",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Favorites()));
            }
          });
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Observer(builder: (_) {
                  if (productController.asyncJsonProductList == null) {
                    return Text("Nulo");
                  }
                  if (productController.asyncJsonProductList.status ==
                      FutureStatus.pending) {
                    return CircularProgressIndicator();
                  }

                  if (productController.asyncJsonProductList.error != null) {
                    return Text("Erro");
                  }
                  return Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: _selectBox(
                        label: productController.selectedItem,
                        item: productValue,
                        controller: productController,
                        list: productController.listProduct,
                      ));
                }),
                SizedBox(height: 20),
                Observer(builder: (_) {
                  if (convertFromController.asyncJsonMeasureList == null) {
                    return Text("Nulo");
                  }
                  if (convertFromController.asyncJsonMeasureList.status ==
                      FutureStatus.pending) {
                    return CircularProgressIndicator();
                  }

                  if (convertFromController.asyncJsonMeasureList.error !=
                      null) {
                    return Text("Erro");
                  }
                  return Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: _selectBox(
                        label: convertFromController.selectedItem,
                        item: convertFromValue,
                        controller: convertFromController,
                        list: convertFromController.listMeasure,
                      ));
                }),
                SizedBox(height: 20),
                Observer(builder: (_) {
                  if (convertToController.asyncJsonMeasureList == null) {
                    return Text("Nulo");
                  }
                  if (convertToController.asyncJsonMeasureList.status ==
                      FutureStatus.pending) {
                    return CircularProgressIndicator();
                  }
                  if (convertToController.asyncJsonMeasureList.error != null) {
                    return Text("Erro");
                  }
                  return Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: _selectBox(
                        label: convertToController.selectedItem,
                        item: convertToValue,
                        controller: convertToController,
                        list: convertToController.listMeasure,
                      ));
                }),
                SizedBox(height: 20),
                SizedBox(
                    child: Container(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: _textField(
                    label: "Quantity",
                    onChanged: (value) {
                      quantityController.setSelectedItem(value.toString());
                    },
                  ),
                )),
                SizedBox(height: 60),
                Observer(builder: (_) {
                  if (productController.selectedItem != "") {
                    return Container(
                        child: Text(
                      '${quantityController.transaction}' +
                          ' ${convertFromController.transaction} de' +
                          ' ${productController.transaction} equivale [result]' +
                          ' ${convertToController.transaction}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ));
                  } else {
                    return Text(
                      'Resultado estará aqui.',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectBox({String label, String item, controller, List list}) {
    return DropdownButton(
      hint: Text(label),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 40,
      elevation: 5,
      isExpanded: true,
      underline: SizedBox(),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      value: item,
      onChanged: (newItem) {
        controller.setSelectedItem(newItem.name);
      },
      items: list
          .map<DropdownMenuItem<Object>>((valueItem) =>
              new DropdownMenuItem<Object>(
                  value: valueItem, child: Text(valueItem.name)))
          .toList(),
    );
  }

  _textField({String label, onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
