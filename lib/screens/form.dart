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


