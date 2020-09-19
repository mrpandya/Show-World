import 'package:ShowWorld/models/listed_data.dart';
import 'package:ShowWorld/providers/data.dart';
import 'package:ShowWorld/providers/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './category_dropdown.dart';
import './duration_dropdown.dart';

final durationKey = new GlobalKey<DurationFieldState>();
final categoryKey = new GlobalKey<CategoryFieldsState>();

UnderlineInputBorder textFieldDecoration = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xff1b4f72),
  ),
);
UnderlineInputBorder focusedTextFieldDecoration = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.blueAccent,
  ),
);

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _lastnamefocusnode = FocusNode();
  final _addressfocusnode = FocusNode();
  final _phonenumberfocusnode = FocusNode();
  final _emailfocusnode = FocusNode();
  final _form = GlobalKey<FormState>();
  PaymentProvider _payment;
  DataProvider _dataProvider;
  bool _isInit = true;
  String _firstname, _lastname;

  var _listeddata = ListedDataModel(
    fullname: "",
    address: "",
    mob: "",
    mail: "",
    time: DateTime.now(),
    category: "",
    subcategory: "",
    price: 0,
  );

  void _saveForm() {
    var validated = (_form.currentState.validate()) &&
        (durationKey.currentState.dropdownDurationvalue !=
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day)) &&
        (categoryKey.currentState.selectedSubCategory != "Unlisted");
    if (!validated) {
      return;
    }
    _form.currentState.save();
    _listeddata = ListedDataModel(
      fullname:
          "${_firstname[0].toUpperCase()}${_firstname.substring(1)} ${_lastname[0].toUpperCase()}${_lastname.substring(1)}",
      address: _listeddata.address,
      mob: _listeddata.mob,
      mail: _listeddata.mail,
      time: durationKey.currentState.dropdownDurationvalue,
      category: categoryKey.currentState.selectedCategory,
      subcategory: categoryKey.currentState.selectedSubCategory,
      price: durationKey.currentState.prices,
    );
    _payment.makePaymentListYourself(_listeddata);
    //Error handling: i.e. on no input by user, REMAINING
    print("name: ${_listeddata.fullname}");
    print(
      "time: ${_listeddata.time.toIso8601String()} category:${_listeddata.category} subcategory:${_listeddata.subcategory} price: ${_listeddata.price}",
    );
    _dataProvider.fetchData(force: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _payment = Provider.of<PaymentProvider>(context);
    }
    _isInit = false;
  }

  @override
  void dispose() {
    _lastnamefocusnode.dispose();
    _addressfocusnode.dispose();
    _phonenumberfocusnode.dispose();
    _emailfocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
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
          margin: EdgeInsets.only(top: 20.0),
          alignment: Alignment.topCenter,
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                //Title
                Card(
                  shadowColor: Colors.blue[300],
                  elevation: 1,
                  color: Color(0xdd1a5276),
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "roboto",
                          fontSize: _width * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.account_box,
                              size: _width * 0.075,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "    List Yourself",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Disclaimer
                Column(
                  children: <Widget>[
                    Text(
                      "*Your data will be recorded in a separate category. ",
                      style: TextStyle(
                        fontFamily: 'roboto',
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Eg. Artist (Listed)",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                //Form Fields
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          key: ValueKey("firstname"),
                          decoration: InputDecoration(
                              labelText: "First Name",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(_lastnamefocusnode),
                          onSaved: (newValue) => _firstname = newValue,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Please fill your first name";
                            }
                            if (value.trim().length < 2) {
                              return "Please enter a first name with atleast 3 characters";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          key: ValueKey("lastname"),
                          decoration: InputDecoration(
                              labelText: "Last Name",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          focusNode: _lastnamefocusnode,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(_addressfocusnode),
                          onSaved: (newValue) => _lastname = newValue,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Please fill your last name";
                            }
                            if (value.trim().length < 3) {
                              return "Please enter a last name with atleast 3 characters";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          key: ValueKey("address"),
                          decoration: InputDecoration(
                              labelText: "Address",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          minLines: null,
                          maxLines: null,
                          focusNode: _addressfocusnode,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(_phonenumberfocusnode),
                          onSaved: (newValue) => _listeddata = ListedDataModel(
                            fullname: _listeddata.fullname,
                            address: newValue,
                            mob: _listeddata.mob,
                            mail: _listeddata.mail,
                            time: _listeddata.time,
                            category: _listeddata.category,
                            subcategory: _listeddata.subcategory,
                            price: _listeddata.price,
                          ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Please fill your first name";
                            }
                            if (value.trim().length < 3) {
                              return "Please enter a name with atleast 3 characters";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          key: ValueKey("phonenumber"),
                          decoration: InputDecoration(
                              labelText: "Phone Number",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          focusNode: _phonenumberfocusnode,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(_emailfocusnode),
                          onSaved: (newValue) => _listeddata = ListedDataModel(
                            fullname: _listeddata.fullname,
                            address: _listeddata.address,
                            mob: newValue,
                            mail: _listeddata.mail,
                            time: _listeddata.time,
                            category: _listeddata.category,
                            subcategory: _listeddata.subcategory,
                            price: _listeddata.price,
                          ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Enter a phone number";
                            }
                            if (value.trim().length == 10 ||
                                value.trim().length == 13) {
                              return null;
                            }
                            return "Your phone number must be 10 digit long";
                          },
                        ),
                        TextFormField(
                          key: ValueKey("emailid"),
                          decoration: InputDecoration(
                              labelText: "Email id",
                              focusedBorder: focusedTextFieldDecoration,
                              enabledBorder: textFieldDecoration),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          focusNode: _emailfocusnode,
                          onSaved: (newValue) => _listeddata = ListedDataModel(
                            fullname: _listeddata.fullname,
                            address: _listeddata.address,
                            mob: _listeddata.mob,
                            mail: newValue,
                            time: _listeddata.time,
                            category: _listeddata.category,
                            subcategory: _listeddata.subcategory,
                            price: _listeddata.price,
                          ),
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).unfocus(),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        DurationField(key: durationKey),
                        CategoryFields(key: categoryKey),
                      ],
                    ),
                  ),
                ),
                //List Button
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: _width * 0.3,
                  ),
                  child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'roboto',
                          fontSize: _width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    disabledColor: Colors.blueGrey,
                    color: Color(0xdd1a5276),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: _saveForm,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
