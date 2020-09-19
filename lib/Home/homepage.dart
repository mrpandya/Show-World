import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../providers/payment.dart';
import '../Desktop/drawer.dart';
import './advtCard.dart';
import './cards.dart';
import '../LoginOTP/stores/login_store.dart';
import '../providers/category.dart';
import '../providers/data.dart';
import '../providers/prices.dart';

class HomePage extends StatefulWidget {
  final Map<String, List<String>> _advertisements;
  HomePage(this._advertisements);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Fluttertoast.showToast(
      msg: "Welcome",
      backgroundColor: Colors.cyan,
    );
    print("Ads: ${widget._advertisements.toString()}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DataProvider()),
        ChangeNotifierProvider.value(value: CategoryProvider()),
        ChangeNotifierProvider.value(value: PaymentProvider()),
        ChangeNotifierProvider.value(value: PricesProvider()),
        Provider.value(value: LoginStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xffd4e6f1),
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 2,
              titleSpacing: 1,
              centerTitle: true,
              title: const Text(
                'SHOW WORLD',
                style: TextStyle(
                  fontFamily: "roboto",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: 25,
                  color: Color(0xff1b4f72),
                ),
              ),
              iconTheme: const IconThemeData(
                color: Color(0xff1b4f72),
              ),
            ),
          ),
          drawer: Drawer(
            elevation: 5,
            child: DrawerItems(),
            semanticLabel: "Drawer",
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: AdvertisementCardTop(widget._advertisements['top']),
                ),
                Expanded(
                  child: DirectoryCard(),
                ),
                Expanded(
                  child: ListCard(),
                ),
                Expanded(
                  child: BuyCard(),
                ),
                Expanded(
                  flex: 2,
                  child:
                      AdvertisementCardBottom(widget._advertisements['bottom']),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
