
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  List listItem = [
    "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7",  
  ];

  String getItens(List<String> list) {
    list.forEach((element) {
      return element.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text('Favoritos')
      ),
      body: ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              borderOnForeground: true,
              child: ListTile(
                onTap: () {
                  print(listItem[index]);
                },
                leading: Icon(Icons.article_rounded),
                title: Text(listItem[index]),
              ),
            ),
          );
        },
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