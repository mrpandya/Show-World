import 'package:ShowWorld/listyourself/listpage.dart';
import 'package:flutter/material.dart';

import './categorypage.dart';
import '../LoginOTP/stores/login_store.dart';
import '../subscriptionpage/subscriptionpage.dart';
import '../auth/auth-api.dart' as auth;

TextStyle drawerfonts =
    TextStyle(color: Color(0xff1b4f72), fontFamily: "roboto");

class DrawerItems extends StatefulWidget {
  @override
  _DrawerItemsState createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  final _user = auth.user;

  @override
  Widget build(BuildContext context) {
    print(_user.toString());
    return Container(
      color: Color(0xfff8f8ff),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            onDetailsPressed: null,
            currentAccountPicture: CircleAvatar(
              child: Image.asset("assets/user.png"),
            ),
            accountName: Text(
              "My Account",
              style: TextStyle(
                color: Color(0xfff8f8ff),
                fontWeight: FontWeight.bold,
                fontFamily: "roboto",
              ),
            ),
            accountEmail: Text(
              "${_user.phoneNumber}",
              style: TextStyle(
                color: Color(0xfff8f8ff),
                fontWeight: FontWeight.bold,
                fontFamily: "roboto",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Color(0xff1b4f72)),
            title: Text(
              'Home',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.list, color: Color(0xff1b4f72)),
            title: Text(
              'Categories',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CategoryPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.input, color: Color(0xff1b4f72)),
            title: Text(
              'List Yourself',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ListPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Color(0xff1b4f72)),
            title: Text(
              'Buy Full Version',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SubscriptionPage();
                  },
                ),
              ).then((value) => {});
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Color(0xff1b4f72)),
            title: Text(
              'About Us',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AboutDialog(
                      applicationName: 'Show World',
                      applicationVersion: '1.0.0',
                      applicationIcon: Image.asset(
                        'assets/logo.png',
                        height: 60.0,
                      ),
                      children: <Widget>[
                        Divider(),
                        Text(
                          "For any problems contact ShowWorld at +91 98211-53135",
                        ),
                        Divider(),
                        Text(
                          "Developed by Team Eureka (Contact: +91 88502-83085)",
                        ),
                        Divider(),
                      ],
                      applicationLegalese: "© ShowWorld 2020",
                    );
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Color(0xff1b4f72)),
            title: Text(
              'Log Out',
              style: drawerfonts,
            ),
            onTap: () {
              Navigator.pop(context);
              LoginStore().signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
