import 'package:cooking_converter/core/app_colors.dart';
import 'package:cooking_converter/screens/form_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int _currentIndex = 1;

  List listItem;

  @override
  void initState() {
    super.initState();
    listItem = List();
    addStrings();
  }

  addStrings() {
    listItem.add("* gramas de arroz, equivale a * de kilogramas");
    listItem.add("* xicarás de sal, equivale a * de kilogramas");
    listItem.add("* gramas de pimenta, equivale a * de kilogramas");
    listItem.add("* kilogramas de cocaína, equivale a * de colher(es) de sopa");
  }

  removeString(index) {
    setState(() {
      listItem.removeAt(index);
    });
  }

  showSnackBar(context, item) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("String deleted")));
  }

  Widget list() {
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return row(context, index);
        },
      ),
    );
  }

  Widget row(content, index) {
    return Dismissible(
      key: Key(listItem[index]),
      onDismissed: (direction) {
        var item = listItem[index];
        showSnackBar(context, item);
        removeString(index);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.lightGray,
        borderOnForeground: true,
        child: ListTile(
          minVerticalPadding: 30,
          onTap: () {
            print(listItem[index]);
          },
          title: Text(
            listItem[index],
            style:
                GoogleFonts.openSans(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
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
            if (_currentIndex == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductForm()));
            }
          });
        },
      ),
      body: list(),
    );
  }
}
