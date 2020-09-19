import 'dart:convert';

import 'package:ShowWorld/models/listed_data.dart';
import 'package:ShowWorld/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../auth/auth-api.dart' as auth;

class PaymentProvider with ChangeNotifier {
  bool _notsubscribed = true;
  Razorpay _razorpaySubscription = Razorpay();

  @override
  void dispose() {
    super.dispose();
    _razorpaySubscription.clear();
    _razorpayListYourself.clear();
  }

  bool get subscriptionstatus {
    return _notsubscribed;
  }

  void httpsubscribed() async {
    var _extract = await http.get(auth.urlallusers);
    _notsubscribed = jsonDecode(_extract.body) == null;
    notifyListeners();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful Restart app to see changes");
    _notsubscribed = false;
    notifyListeners();
    Map<String, String> data = {
      'mob': '${auth.user.phoneNumber}',
      'timestamp': '${DateTime.now().toIso8601String()}',
    };
    try {
      sendhttpRequest(data);
      Fluttertoast.showToast(
        msg: "Payment Successful",
        backgroundColor: Colors.green,
      );
    } catch (e) {
      throw (e);
    }
  }

  void sendhttpRequest(Map<String, String> data) async {
    try {
      await http
          .patch(
        auth.urlallusers,
        headers: {"Accept": "application/json"},
        body: jsonEncode(data),
      )
          .then(
        (value) async {
          print("User Added to Subscription List");
          await DataProvider().fetchData(force: true);
          notifyListeners();
        },
      );
    } catch (e) {
      throw (e);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment failed");
    Fluttertoast.showToast(
      msg: "Payment Failed",
      backgroundColor: Colors.red,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("Choosing Wallet");
  }

  void makePayment(double price) {
    _razorpaySubscription.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpaySubscription.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpaySubscription.on(
        Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    var options = {
      'key': '${auth.razorpaykey}',
      'amount': price * 100,
      'name': 'Show World Subscription',
      'description': 'Subscription',
      'prefill': {
        'contact': '${auth.user.phoneNumber}',
      }
    };
    try {
      _razorpaySubscription.open(options);
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  //ListYourself
  Razorpay _razorpayListYourself = Razorpay();

  ListedDataModel _listyourselfsuccess;

  void _handlePaymentSuccessListYourself(PaymentSuccessResponse response) {
    print("Listed Successfully in ${_listyourselfsuccess.category}");
    Map<String, dynamic> _data = {
      'address': _listyourselfsuccess.address,
      'mail': _listyourselfsuccess.mail,
      'listends': _listyourselfsuccess.time.toIso8601String(),
    };

    //Send Data
    try {
      http
          .patch(
        '${auth.url}/data/${_listyourselfsuccess.category}%20(Listed)/${_listyourselfsuccess.subcategory}/${_listyourselfsuccess.fullname}.json?auth=${auth.token}',
        headers: {"Accept": "application/json"},
        body: jsonEncode(_data),
      )
          .then(
        (value) {
          print(
            "User details in ${_listyourselfsuccess.category} (Listed) Category",
          );
        },
      );
    } catch (e) {
      throw (e);
    }
    //Send Mobile
    try {
      http
          .put(
        '${auth.url}/data/${_listyourselfsuccess.category}%20(Listed)/${_listyourselfsuccess.subcategory}/${_listyourselfsuccess.fullname}/mob.json?auth=${auth.token}',
        headers: {"Accept": "application/json"},
        body: jsonEncode([_listyourselfsuccess.mob]),
      )
          .then(
        (value) async {
          print(
            "${value.body}",
          );
          Fluttertoast.showToast(
            msg:
                "Listed Successfully in ${_listyourselfsuccess.category} (Listed) category",
            backgroundColor: Colors.green,
          );
          await DataProvider().fetchData(force: true);
          notifyListeners();
        },
      );
    } catch (e) {
      throw (e);
    }
  }

  void _handlePaymentErrorListYourself(PaymentFailureResponse response) {
    print("Payment failed");
    Fluttertoast.showToast(
      msg: "Payment Failed",
      backgroundColor: Colors.red,
    );
  }

  void _handleExternalWalletListYourself(ExternalWalletResponse response) {
    print("Choosing Wallet");
  }

  void makePaymentListYourself(ListedDataModel listedDataModel) {
    _razorpayListYourself.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccessListYourself);
    _razorpayListYourself.on(
        Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentErrorListYourself);
    _razorpayListYourself.on(
        Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWalletListYourself);

    var options = {
      'key': '${auth.razorpaykey}',
      'amount': listedDataModel.price * 100,
      'name': 'Show World List Yourself',
      'description':
          'name: ${listedDataModel.fullname} mob: ${listedDataModel.mob} category: ${listedDataModel.category}',
      'prefill': {
        'contact': '${auth.user.phoneNumber}',
      }
    };

    _listyourselfsuccess = listedDataModel;
    try {
      _razorpayListYourself.open(options);
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
