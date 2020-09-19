import 'package:flutter/material.dart';

import '../Desktop/subcategorytiles.dart';

class SubCategoryPage extends StatefulWidget {
  final List subcategory;
  final String category;
  SubCategoryPage({this.subcategory, this.category});

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  var _isInit = true;
  List _subcategory = [];
  List _filteredsubcategory = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _subcategory = widget.subcategory;
      _filteredsubcategory = _subcategory;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("${_filteredsubcategory.length}");
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
          margin: EdgeInsets.only(top: 20),
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
                      hintText: "Search Sub-Category",
                      hintStyle: TextStyle(
                        fontFamily: "roboto",
                        color: Color(0x881a5276),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _filteredsubcategory = _subcategory
                            .where((u) =>
                                u.toLowerCase().contains(text.toLowerCase()))
                            .toList();
                      });
                      print("$_filteredsubcategory");
                    },
                  ),
                ),
              ),
              // data region
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: _filteredsubcategory.length,
                  itemBuilder: (ctx, index) {
                    print("${_filteredsubcategory.length}");
                    return Container(
                      key: ValueKey(_filteredsubcategory[index]),
                      child: SubCategoryTile(
                        subcategory: _filteredsubcategory[index],
                        category: widget.category,
                      ),
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
