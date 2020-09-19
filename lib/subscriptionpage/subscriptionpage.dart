import 'package:ShowWorld/Desktop/data_format.dart';
import 'package:ShowWorld/providers/payment.dart';
import 'package:ShowWorld/providers/prices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'coupons.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  PricesProvider _pricesProvider;
  PaymentProvider _payment;
  List<DurationTemplate> _pricelist;
  var _isInit = true;
  var _loading = true;

  @override
  void didChangeDependencies() {
    _pricesProvider = Provider.of<PricesProvider>(context);
    _payment = Provider.of<PaymentProvider>(context);
    if (_isInit) {
      addPriceItems();
    }
    setState(() {
      _payment.httpsubscribed();
      _pricelist = _pricesProvider.subscriptionlist;
      _loading = false;
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  void addPriceItems() async {
    await _pricesProvider.fetchPricesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).pop(_payment.subscriptionstatus),
          ),
        ),
      ),
      body: (_pricelist.length == 0) || _loading
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          'Choose Subscription Plan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '(Get access to ',
                            ),
                            TextSpan(
                              text: '25,000+ listings',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' in ',
                            ),
                            TextSpan(
                              text: '300+ categories',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' across the film and music industry)',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      _payment.subscriptionstatus ? _pricelist.length : 1,
                      (i) {
                        return _payment.subscriptionstatus
                            ? Coupons(
                                "${_pricelist.elementAt(i).months} Months",
                                _pricelist.elementAt(i).price,
                              )
                            : Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You have already subscribed",
                                      style: TextStyle(
                                        height: 5.0,
                                        color: Colors.green,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Restart the app if you do not see the full access",
                                      style: TextStyle(
                                        height: 5.0,
                                        color: Colors.amber,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
