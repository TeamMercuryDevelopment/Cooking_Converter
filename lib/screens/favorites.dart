
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
    );
  }
}