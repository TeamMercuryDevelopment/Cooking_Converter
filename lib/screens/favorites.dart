
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
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text('Favoritos')
      ),
      body: ListView(
        children: <Widget> [
          ListTile(
                leading: Icon(Icons.article_rounded),
                title: Text('Arroz'),
          ),
          ListTile(
                leading: Icon(Icons.article_rounded),
                title: Text('Batata'),
          ),
          ListTile(
                leading: Icon(Icons.article_rounded),
                title: Text('Feijão'),
          ),
          ListTile(
                leading: Icon(Icons.article_rounded),
                title: Text('Açucar'),
          ),
        ],
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