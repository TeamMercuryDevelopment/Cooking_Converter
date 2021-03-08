import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectBox extends StatelessWidget {
  final String label;
  final controller;
  String value;
  final List list;

  SelectBox({
    this.label,
    this.value,
    this.controller,
    this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                  ),
              ),
              child: DropdownButton(
                hint: Text(label),
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
                  value = newValue;
                  controller.setName(value);
                },
                items: list.map<DropdownMenuItem<String>>((valueItem) =>
                new  DropdownMenuItem<String>(
                  value: valueItem,
                  child: Text(valueItem)
                  )
                ).toList(),
              ),
            );
  }
}