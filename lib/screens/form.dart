import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  String value;
  List listItem = [
    "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 4", "Item 4", "Item 4", "Item 4", "Item 4", "Item 4", "Item 4", "Item 4", "Item 4", "Item 4", "Item 4",
  ];

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
                  children: <Widget> [
                    SizedBox(
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                            ),
                        ),
                        child: DropdownButton(
                          hint: Text("Produto"),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 40,
                          elevation: 5,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          value: value,
                          onChanged: (newValue) {
                            setState (() {
                              value = newValue;
                            });
                          },
                          items: listItem.map<DropdownMenuItem<String>>((valueItem) =>
                          new  DropdownMenuItem<String>(
                            value: valueItem,
                            child: Text(valueItem)
                            )
                          ).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Converter de"
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Quantidade"
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Converter para"
                        ),
                      ),
                    ),
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
}


