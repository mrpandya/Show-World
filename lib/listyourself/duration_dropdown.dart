import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Desktop/data_format.dart';
import '../providers/prices.dart';

class DurationField extends StatefulWidget {
  DurationField({Key key}) : super(key: key);
  @override
  DurationFieldState createState() => DurationFieldState();
}

class DurationFieldState extends State<DurationField> {
  PricesProvider _pricesprovider;
  List<DurationTemplate> _listyourself = [];
  List<DropdownMenuItem<String>> _durationdropdown = [];
  bool _isInit = true;
  String _dropdownDurationValue;

  DateTime get dropdownDurationvalue {
    return DateTime(
        DateTime.now().year,
        DateTime.now().month +
            int.tryParse(
              _dropdownDurationValue == null ? '0' : _dropdownDurationValue,
            ),
        DateTime.now().day);
  }

  double get prices {
    return _dropdownDurationValue == null
        ? 0
        : _listyourself
            .firstWhere((e) => e.months == _dropdownDurationValue)
            .price;
  }

  @override
  void didChangeDependencies() {
    _pricesprovider = Provider.of<PricesProvider>(context);
    if (_isInit) {
      setState(() {
        addDropdownItems();
      });
    }
    _listyourself = _pricesprovider.listyourselflist;
    print("_durations = $_listyourself");
    _listyourself.forEach((e) {
      _durationdropdown.add(
        DropdownMenuItem<String>(
          key: ValueKey("Duration"),
          child: Text(
            "${e.months} months Rs.${e.price}",
            style: TextStyle(
              color: Color(0xff1b4f72),
            ),
          ),
          value: e.months,
        ),
      );
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  void addDropdownItems() async {
    await _pricesprovider.fetchPricesData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButton<String>(
        hint: Text("Duration"),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
        ),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 1,
          width: 1,
          color: Color(0xff1b4f72),
        ),
        value: _dropdownDurationValue,
        items: _durationdropdown,
        onChanged: (String newValue) {
          print("Changing to $newValue");
          setState(() {
            _dropdownDurationValue = newValue;
          });
        },
      ),
    );
  }
}
