import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controller;
  final String label;

  Editor({
    this.controller,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(
            color: Colors.black, fontSize: 25.0
        ),
      ),
    );
  }
}