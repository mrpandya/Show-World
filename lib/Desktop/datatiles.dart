import 'package:flutter/material.dart';

import '../subscriptionpage/subscriptionpage.dart';

class DataTile extends StatefulWidget {
  final String name, category, subcategory, address, email;
  final List<dynamic> phonenumber;
  DataTile(
      {this.name,
      this.category,
      this.subcategory,
      this.address,
      this.phonenumber,
      this.email});

  @override
  _DataTileState createState() => _DataTileState(this.name, this.category,
      this.subcategory, this.address, this.phonenumber, this.email);
}

class _DataTileState extends State<DataTile> {
  final String name, category, subcategory, address, email;
  final List<dynamic> phonenumber;
  _DataTileState(
    this.name,
    this.category,
    this.subcategory,
    this.address,
    this.phonenumber,
    this.email,
  );

  bool _showdetails = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            borderRadius: _showdetails
                ? const BorderRadius.vertical(top: const Radius.circular(10.0))
                : const BorderRadius.all(const Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: ListTile(
            title: Text(
              "$name",
              style: TextStyle(
                fontFamily: "roboto",
                fontWeight: FontWeight.bold,
                color: Color(0xff5499c7),
              ),
            ),
            subtitle: Text("$category : $subcategory",
                style: TextStyle(
                  fontFamily: "roboto",
                  color: Color(0xff5499c7),
                )),
            trailing: Icon(
                _showdetails ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            dense: true,
            onTap: () {
              setState(() {
                _showdetails = !_showdetails;
              });
            },
          ),
        ),
        _showdetails
            ? detailsCard(
                context: context,
                address: address,
                phonenumber: phonenumber,
                email: email,
              )
            : SizedBox(width: 10)
      ],
    );
  }
}

Widget detailsCard(
    {@required BuildContext context,
    String address,
    List<dynamic> phonenumber,
    String email}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
          color: Color(0xffa9cce3),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: address != 'demo' && email != 'demo'
            ? Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Address:",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "$address",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Phone number:",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "${phonenumber.map((e) => e.toString())}",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Email:",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "$email",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Center(
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      label: Expanded(
                        child: Center(
                          child: Text(
                            "Subscribe to view Details",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                      ),
                      color: Colors.red[700],
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SubscriptionPage();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
      ),
      SizedBox(width: 10),
    ],
  );
}
