import 'package:cooking_converter/screens/form_page.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int _currentIndex = 1;

  List listItem = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: Text('Favoritos')),
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
            if (_currentIndex == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductForm()));
            }
          });
        },
      ),
      body: ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 0.0),
            child: Card(
              borderOnForeground: true,
              child: ListTile(
                onTap: () {
                  print(listItem[index]);
                },
                leading: Icon(
                  Icons.article_rounded,
                  size: 32.0,
                ),
                title: Text(listItem[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
