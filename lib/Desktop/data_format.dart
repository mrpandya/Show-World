class DataTemplate {
  int id;
  String category, subcategory, name, address, email;
  List<dynamic> phonenumber;
  DataTemplate({
    this.id,
    this.name,
    this.category,
    this.subcategory,
    this.address,
    this.phonenumber,
    this.email,
  });
}

class CategoryTemplate {
  int id;
  String category;
  List subcategory;
  CategoryTemplate({this.id, this.category, this.subcategory});
}

class DurationTemplate {
  String months;
  double price;
  DurationTemplate({this.months, this.price});
}
