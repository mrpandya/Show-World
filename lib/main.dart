import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './LoginOTP/pages/splash_page.dart';
import './LoginOTP/stores/login_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: LoginStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
