import 'package:cooking_converter/components/list_product.dart';
import 'package:cooking_converter/models/product.dart';
import 'package:cooking_converter/models/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:cooking_converter/components/editor.dart';
//import 'package:cooking_converter/models/product.dart';

const _appBarTitle = "Cooking Converter";

// const _labelProduct = "Produto";
const _labelConvertFrom = "Converter de";
const _labelValue = "Quantidade";
const _labelConvertTo = "Converter para";


class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  // TextEditingController _productController = TextEditingController();
  TextEditingController _convertFromController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
  TextEditingController _convertToController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    // _productController.text = "";
    _convertFromController.text = "";
    _valueController.text = "";
    _convertToController.text = "";

    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  //void _clearAll() {
  //  _productController.text = "";
  //  _convertFromController.text = "";
  //  _valueController.text = "";
  //  _convertToController.text = "";
  //}

  final productController = ProductController();
  Product _selectedProduct;
  
  @override
  void initState() {
    productController.dropdownMenuItems = productController.buildDropdownMenuItems(productController.products);
    productController.selectedProduct = productController.dropdownMenuItems[0].value;
    super.initState();
  }

  onChangeDropdownItem(Product selectedProduct) {
    setState(() {
      _selectedProduct = selectedProduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text(_appBarTitle),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ListProduct(
                      controller: productController.productController,
                      selectedProduct: _selectedProduct,
                      dropdownMenuItems: productController.dropdownMenuItems,
                      onChange: onChangeDropdownItem,
                    ),
                    Editor(
                      controller: _convertFromController,
                      label: _labelConvertFrom,
                    ),
                    Editor(
                      controller: _valueController,
                      label: _labelValue,
                    ),
                    Editor(
                      controller: _convertToController,
                      label: _labelConvertTo,
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        
                      },
                    )
                  ],
                )
            )
        )
    );
  }
}


