import 'package:flutter/material.dart';

import '../Desktop/subcategorypage.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final List subcategory;
  CategoryTile({this.category, this.subcategory});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "$category",
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
                return SubCategoryPage(
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
