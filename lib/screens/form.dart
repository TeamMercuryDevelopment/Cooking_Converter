import 'package:cooking_converter/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  String productValue;
  String convertFromValue;
  String convertToValue;
  final productController = Controller();
  final convertFromController = Controller();
  final convertToController = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Observer(builder: (_) {
                  return Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
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
                  return Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: _selectBox(
                        label: convertFromController.selectedItem,
                        item: convertFromValue,
                        controller: convertFromController,
                        list: convertFromController.listConvert,
                      ));
                }),
                SizedBox(height: 20),
                SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Quantidade"),
                  ),
                ),
                SizedBox(height: 20),
                Observer(builder: (_) {
                  return Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: _selectBox(
                        label: convertToController.selectedItem,
                        item: convertToValue,
                        controller: convertToController,
                        list: convertToController.listConvert,
                      ));
                }),
                SizedBox(height: 20),
                Observer(builder: (_) {
                  return Text('${productController.transaction}' + ' ${convertFromController.transaction} para' + ' ${convertToController.transaction}');
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            // ignore: deprecated_member_use
            title: Text("Conversor"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            // ignore: deprecated_member_use
            title: Text("Favoritos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review_rounded),
            // ignore: deprecated_member_use
            title: Text("Avalie-nos"),
          ),
        ],
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
        controller.setSelectedItem(newItem.toString());
      },
      items: list
          .map<DropdownMenuItem<Object>>((valueItem) =>
              new DropdownMenuItem<Object>(
                  value: valueItem, child: Text(valueItem.toString())))
          .toList(),
    );
  }
}
