import 'dart:ui';

import 'package:ShowWorld/Desktop/data_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';

class CategoryFields extends StatefulWidget {
  CategoryFields({Key key}) : super(key: key);
  @override
  CategoryFieldsState createState() => CategoryFieldsState();
}

class CategoryFieldsState extends State<CategoryFields> {
  String _dropdownCategoryValue;
  String _dropdownSubcategoryValue;
  CategoryProvider _categoryprovider;
  List<CategoryTemplate> _categories = [];
  List<DropdownMenuItem<String>> _categorydropdown = [];
  Map<String, List<DropdownMenuItem<String>>> _subcategorydropdown = {};
  bool _isInit = true;

  String get selectedCategory {
    return _dropdownCategoryValue == null ? "Unlisted" : _dropdownCategoryValue;
  }

  String get selectedSubCategory {
    return _dropdownSubcategoryValue == null
        ? "Unlisted"
        : _dropdownSubcategoryValue;
  }

  @override
  void didChangeDependencies() {
    _categoryprovider = Provider.of<CategoryProvider>(context);
    if (_isInit) {
      setState(() {
        addDropdownItems();
      });
    }
    _categories = _categoryprovider.categorylist;
    print("_categories = $_categories");
    _categories.forEach((e) {
      _categorydropdown.add(
        DropdownMenuItem<String>(
          key: ValueKey("Category"),
          child: Text(
            e.category,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: Color(0xff1b4f72),
            ),
          ),
          value: e.category,
        ),
      );
      _subcategorydropdown.addAll({
        e.category: e.subcategory
            .map(
              (subcat) => DropdownMenuItem<String>(
                key: ValueKey(subcat),
                child: Text(
                  subcat,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Color(0xff1b4f72),
                  ),
                ),
                value: subcat,
              ),
            )
            .toList() as List<DropdownMenuItem<String>>,
      });
      print("_subcat : $_subcategorydropdown");
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  void addDropdownItems() async {
    await _categoryprovider.fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    // var _width = MediaQuery.of(context).size.width;
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 12.5),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DropdownButton<String>(
            hint: Text(
              "Category",
              overflow: TextOverflow.fade,
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 1,
              width: 1,
              color: Color(0xff1b4f72),
            ),
            value: _dropdownCategoryValue,
            items: _categorydropdown,
            onChanged: (String newValue) {
              print("Changing to $newValue");
              setState(() {
                _dropdownSubcategoryValue = null;
                _dropdownCategoryValue = newValue;
              });
            },
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DropdownButton<String>(
            hint: Text(
              "Sub Category",
              overflow: TextOverflow.fade,
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 1,
              color: Color(0xff1b4f72),
            ),
            value: _dropdownSubcategoryValue,
            items: _subcategorydropdown[_dropdownCategoryValue],
            onChanged: (String newValue) {
              print("Changing to $newValue");
              setState(() {
                _dropdownSubcategoryValue = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
