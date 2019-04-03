import 'package:flutter/material.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  var currencies = {"Rupees", "Dollars", "Others"};
  var selectedItem = 'Rupees';
  var result = '';
  TextEditingController principalcontroller = TextEditingController();
  TextEditingController ratecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

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
              controller: principalcontroller,
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
              controller: ratecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Rate',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white, width: 1))),
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
                      controller: timecontroller,
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
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        this.result=calculate();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(this.result),
          )
        ],
      ),
    );
  }

  void dropdownfun(String newValueSelected) {
    setState(() {
      this.selectedItem = newValueSelected;
    });
  }

  String calculate() {
    double principal = double.parse(principalcontroller.text);
    double rate = double.parse(ratecontroller.text);
    double time = double.parse(timecontroller.text);
    int time1=time.toInt();

    double amount = (principal + (principal * rate * time) / 100);
    var statement="Your amount after $time1 years is $amount $selectedItem.";
    return statement;
  }
}
