import 'package:cooking_converter/controller/convert_to_controller.dart';
import 'package:cooking_converter/controller/product_controller.dart';
import 'package:cooking_converter/controller/conversion_controller.dart';
import 'package:cooking_converter/core/app_colors.dart';
import 'package:cooking_converter/core/app_colors.dart';
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
  final conversionController = ConversionController();

  @override
  void initState() {
    productController.fetchProducts();
    convertToController.fetchMeasures();
    convertFromController.fetchMeasures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Converter",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Favorites",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.favorite),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primaryBlue,
                          AppColors.secondaryBlue
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.offWhite,
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: _textField(
                                  label: "Qtd",
                                  onChanged: (value) {
                                    conversionController
                                        .setSelectedItem(value.toString());
                                  },
                                ),
                              )),
                              Observer(builder: (_) {
                                if (convertFromController
                                        .asyncJsonMeasureList ==
                                    null) {
                                  return Text("Nulo");
                                }
                                if (convertFromController
                                        .asyncJsonMeasureList.status ==
                                    FutureStatus.pending) {
                                  return CircularProgressIndicator();
                                }

                                if (convertFromController
                                        .asyncJsonMeasureList.error !=
                                    null) {
                                  return Text("Erro");
                                }
                                return Container(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8.0),
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      color: AppColors.offWhite,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: _selectBox(
                                      label: convertFromController
                                          .selectedItem.name,
                                      item: convertFromValue,
                                      controller: convertFromController,
                                      list: convertFromController.listMeasure,
                                    ));
                              }),
                            ],
                          ),
                        ),
                        Observer(builder: (_) {
                          if (productController.asyncJsonProductList == null) {
                            return Text("Nulo");
                          }
                          if (productController.asyncJsonProductList.status ==
                              FutureStatus.pending) {
                            return CircularProgressIndicator();
                          }

                          if (productController.asyncJsonProductList.error !=
                              null) {
                            return Text("Erro");
                          }
                          return Container(
                              margin: const EdgeInsets.fromLTRB(
                                  16.0, 32.0, 16.0, 16.0),
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: AppColors.offWhite,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: _selectBox(
                                label: productController.selectedItem.name,
                                item: productValue,
                                controller: productController,
                                list: productController.listProduct,
                              ));
                        }),
                        Observer(builder: (_) {
                          if (convertToController.asyncJsonMeasureList ==
                              null) {
                            return Text("Nulo");
                          }
                          if (convertToController.asyncJsonMeasureList.status ==
                              FutureStatus.pending) {
                            return CircularProgressIndicator();
                          }
                          if (convertToController.asyncJsonMeasureList.error !=
                              null) {
                            return Text("Erro");
                          }
                          return Container(
                              margin: const EdgeInsets.fromLTRB(
                                  16.0, 32.0, 16.0, 16.0),
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: AppColors.offWhite,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: _selectBox(
                                label: convertToController.selectedItem.name,
                                item: convertToValue,
                                controller: convertToController,
                                list: convertToController.listMeasure,
                              ));
                        }),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Positioned(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(218.0, 88.0),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        conversionController.convertIngredient(
                            productController.selectedItem,
                            conversionController.quantity.toString(),
                            convertFromController.selectedItem,
                            convertToController.selectedItem);
                      },
                      child: Text("Converter",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width * 1,
                  top: MediaQuery.of(context).size.height * 0.65,
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                      child: Column(
                        children: <Widget>[
                          Observer(builder: (_) {
                            if (conversionController.responseText != null) {
                              return Container(
                                  child: Text(
                                conversionController.responseText,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ));
                            } else {
                              return Container(
                                child: Text(
                                  'Resultado estará aqui.',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                          }),
                        ],
                      )),
                ),
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
        controller.setSelectedItem(newItem);
      },
      items: list
          .map<DropdownMenuItem<Object>>((valueItem) =>
              new DropdownMenuItem<Object>(
                  value: valueItem, child: Text(valueItem.name)))
          .toList(),
    );
  }

  _textField({String label, onChanged}) {
    return Center(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: label,
          fillColor: AppColors.offWhite,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: AppColors.offWhite, width: 3.0)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: AppColors.offWhite, width: 3.0)),
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
