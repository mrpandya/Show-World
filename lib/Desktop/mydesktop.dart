import '../providers/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import './datatiles.dart';
import 'data_format.dart';

class MyDesktop extends StatefulWidget {
  final String subcategory, category;
  MyDesktop({this.subcategory, this.category});

  @override
  _MyDesktopState createState() => _MyDesktopState();
}

class _MyDesktopState extends State<MyDesktop> {
  bool _isInit = true;
  DataProvider _dataProvider;
  List<DataTemplate> _filteredpeople;
  List<DataTemplate> _subcategorypeople;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _dataProvider = Provider.of<DataProvider>(context);
      _subcategorypeople = _dataProvider.datalist
          .where((u) =>
              u.category == widget.category &&
              u.subcategory == widget.subcategory)
          .toList();
      _filteredpeople = _subcategorypeople;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd4e6f1),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: Color(0xff1b4f72),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              //SearchTab
              Card(
                shadowColor: Colors.blue[300],
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 4,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Color(0xff5499c7),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xdd1a5276), fontFamily: "roboto"),
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff5499c7), width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff5499c7), width: 2)),
                      suffixIcon: Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Color(0xff5499c7),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    onChanged: (text) => setState(() {
                      _filteredpeople = _subcategorypeople
                          .where((u) => (u.name
                              .toLowerCase()
                              .contains(text.toLowerCase())))
                          .toList();
                      print(_filteredpeople);
                    }),
                  ),
                ),
              ),
              // data region
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: _filteredpeople.length,
                  itemBuilder: (ctx, index) {
                    var dataitr = _filteredpeople.elementAt(index);
                    return Container(
                      key: ValueKey(_filteredpeople[index].id),
                      child: DataTile(
                          name: dataitr.name,
                          category: dataitr.category,
                          subcategory: dataitr.subcategory,
                          address: dataitr.address,
                          email: dataitr.email,
                          phonenumber: dataitr.phonenumber),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
