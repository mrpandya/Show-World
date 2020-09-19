import 'package:flutter/material.dart';

import './mydesktop.dart';

class SubCategoryTile extends StatelessWidget {
  final String subcategory, category;
  SubCategoryTile({this.subcategory, this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "$subcategory",
            style: TextStyle(
              fontFamily: "roboto",
              fontWeight: FontWeight.bold,
              color: const Color(0xff5499c7),
            ),
          ),
        ),
        trailing: Icon(Icons.arrow_right),
        dense: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MyDesktop(
                  subcategory: subcategory,
                  category: category,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
