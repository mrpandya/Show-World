import 'package:flutter/material.dart';

class ListedDataModel {
  String category;
  String subcategory;
  String fullname;
  String address;
  String mob;
  String mail;
  DateTime time;
  double price;
  ListedDataModel({
    @required this.category,
    @required this.subcategory,
    @required this.fullname,
    @required this.address,
    @required this.mob,
    @required this.mail,
    @required this.time,
    @required this.price,
  });
}
