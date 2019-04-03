import 'package:flutter/material.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  var currencies = {"Rupees", "Dollars", "Others"};
  var selectedItem='Rupees';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Simple Interest"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              child: Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 20, bottom: 20),
            child: TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Principal Amount',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Rate',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white,width: 1))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    items: currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text((value)),
                      );
                    }).toList(),
                    value: selectedItem,
                    onChanged: (String newValueSelected) {
                      dropdownfun(newValueSelected);
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Calculate",style: TextStyle(color: Colors.white),), onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right:20.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Reset",style: TextStyle(color: Colors.white),), onPressed: () {},
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void dropdownfun(String newValueSelected) {
    setState(() {
      this.selectedItem=newValueSelected;
    });
  }
}
