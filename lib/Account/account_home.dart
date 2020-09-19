import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/cards.dart';
import '../auth/auth-api.dart' as auth;

class AccountHomePage extends StatelessWidget {
  final _user = auth.user;
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Account',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: _width * 0.1),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.15),
                      child: Card(
                        color: Colors.blue[100],
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.only(top: _width * 0.25),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Name: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '${_user.displayName}',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Phone Number : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          '${_user.phoneNumber}',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                      height: 20.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Occupation : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'Director, Producer',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Email : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          '${_user.email}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                      height: 20.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Subscription ends: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          //TO-DO
                                          '${_user.metadata.lastSignInTime.toIso8601String().substring(0, 10)}',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              ListCard(),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Profile Picture
                    SizedBox(
                      width: _width * 0.35,
                      height: _width * 0.35,
                      child: FloatingActionButton(
                        highlightElevation: 10.0,
                        hoverElevation: 10.0,
                        child: CircleAvatar(
                          radius: _width,
                          child: Image.asset(
                            "assets/user.png",
                            fit: BoxFit.cover,
                            width: _width,
                            height: _width,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
