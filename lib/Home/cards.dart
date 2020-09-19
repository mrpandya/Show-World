import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Desktop/categorypage.dart';
import '../subscriptionpage/subscriptionpage.dart';
import '../listyourself/listpage.dart';

class DirectoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
//      highlightColor: Colors.purple[400],
      highlightColor: Color(0xffd4e6f1),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryPage();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.symmetric(
              vertical: BorderSide.none,
              horizontal: BorderSide.none,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple[100],
                blurRadius: 2,
                offset: Offset(1, 3),
                spreadRadius: 1,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Icon(
                Icons.description,
                color: Colors.purple,
                size: 25,
              ),
            ),
            Text(
              "Access Directory",
              style: TextStyle(
                  fontFamily: "roboto",
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Color(0xffd4e6f1),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ListPage();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo[100],
                blurRadius: 2,
                offset: Offset(1, 3),
                spreadRadius: 1,
              ),
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Icon(
                Icons.input,
                color: Colors.indigo,
              ),
            ),
            Text(
              "List Yourself",
              style: TextStyle(
                fontFamily: "roboto",
                fontWeight: FontWeight.w600,
                color: Colors.indigo,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class BuyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Color(0xffd4e6f1),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SubscriptionPage();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue[100],
                blurRadius: 2,
                offset: Offset(1, 3),
                spreadRadius: 1,
              ),
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
            ),
            Text(
              "Buy Full Version",
              style: const TextStyle(
                fontFamily: "roboto",
                fontWeight: FontWeight.w600,
                color: Colors.blue,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class UnListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo[800],
              blurRadius: 2,
              offset: Offset(1, 3),
              spreadRadius: 1,
            ),
          ]),
      child: FlatButton(
        highlightColor: Color(0xffd4e6f1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                right: 20.0,
              ),
              child: Icon(
                Icons.input,
                color: Colors.indigo[800],
              ),
            ),
            Text(
              "Remove Yourself",
              style: TextStyle(
                fontFamily: "roboto",
                color: Colors.indigo[800],
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
