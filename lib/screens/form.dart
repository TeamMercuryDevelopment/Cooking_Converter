import 'dart:html';

import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Cooking Converter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.calculate),
                title: Text('Conversor'),
              ),
              ListTile(
                leading: Icon(Icons.favorite_outline_outlined),
                title: Text('Favoritos'),
              ),
              ListTile(
                leading: Icon(Icons.rate_review_rounded),
                title: Text('Avalie-nos'),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: <Widget> [
                  SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Produto"
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
        )
    );
  }
}


