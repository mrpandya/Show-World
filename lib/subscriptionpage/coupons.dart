import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/payment.dart';

class Coupons extends StatefulWidget {
  final String _duration;
  final double _price;
  Coupons(this._duration, this._price);
  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  bool _tick = false;

  @override
  Widget build(BuildContext context) {
    final PaymentProvider _payment = Provider.of<PaymentProvider>(context);
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(10.0),
      color: Colors.blueGrey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${widget._duration}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'INR ${widget._price} + GST',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  _payment.makePayment(widget._price);
                },
                color: Colors.blueGrey.shade400,
                child: Text(
                  'PROCEED',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    tristate: false,
                    activeColor: Colors.transparent,
                    value: _tick,
                    onChanged: (bool _changedTick) {
                      setState(() {
                        _tick = _changedTick;
                      });
                    },
                  ),
                  Text(
                    'Enable Auto Debit',
                    style: TextStyle(
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
