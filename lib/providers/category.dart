import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Desktop/data_format.dart';
import '../auth/auth-api.dart' as auth;

class CategoryProvider with ChangeNotifier {
  List<CategoryTemplate> _categorydata = [];

  List<CategoryTemplate> get categorylist {
    return [..._categorydata];
  }

  Future<bool> fetchCategoryData() async {
    final urlcategory = auth.urlcategory;
    if (_categorydata.length == 0) {
      try {
        print("Fetched category data");
        final _response = await http.get(urlcategory);
        final _extractedcategory =
            jsonDecode(_response.body) as Map<String, dynamic>;
        List<CategoryTemplate> _loadeddata = [];
        int itr = 0;
        _extractedcategory.forEach((key, value) {
          _loadeddata.add(CategoryTemplate(
            id: itr,
            category: key,
            subcategory: value as List,
          ));
          itr++;
        });
        _categorydata = _loadeddata;
        notifyListeners();
        return false;
      } catch (error) {
        print("Error has occured while fetching category data.");
        throw (error);
      }
    } else {
      print("Category data has already been fetched");
      return false;
    }
  }

  void addCategory() {
    // _categorylist.add(value);
    notifyListeners();
  }
}
