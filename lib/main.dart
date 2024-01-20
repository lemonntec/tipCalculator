// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: tipApp(),
  ));
}

class tipApp extends StatefulWidget {
  const tipApp({super.key});

  @override
  State<tipApp> createState() => _tipAppState();
}

class _tipAppState extends State<tipApp> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  double totalTip = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total Tip Person',
                    style:
                        TextStyle(color: Colors.amber.shade900, fontSize: 18),
                  ),
                  Text(
                    '\$ ${totalAmount()}',
                    style: TextStyle(
                        color: Colors.amber.shade900,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade100,
                    style: BorderStyle.solid,
                  )),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.amber.shade900),
                    decoration: InputDecoration(
                        prefixText: 'Bill Amount',
                        prefixIcon: Icon(Icons.attach_money_sharp)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (e) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              personCountersub();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(child: Text('-')),
                            ),
                          ),
                          Text(
                            '$_personCounter',
                            style: TextStyle(
                                color: Colors.amber.shade900, fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              personCounteradd();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(child: Text('+')),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tip'),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            '\$ ${tipamount()}',
                            style: TextStyle(
                                color: Colors.amber.shade900, fontSize: 20),
                          ),
                        ),
                      ]),
                  SizedBox(height: 15),
                  Text(
                    '$_tipPercentage%',
                    style:
                        TextStyle(color: Colors.amber.shade900, fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  Slider(
                      min: 0,
                      max: 100,
                      // divisions: 10,
                      activeColor: Colors.amber.shade900,
                      inactiveColor: Colors.amber.shade300,
                      value: _tipPercentage.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          _tipPercentage = newValue.round();
                        });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  personCountersub() {
    setState(() {
      if (_personCounter <= 1) {
      } else {
        _personCounter--;
      }
    });
  }

  personCounteradd() {
    setState(() {
      _personCounter++;
    });
  }

  tipamount() {
    if (_billAmount <= 0 ||
        _billAmount.toString().isEmpty ||
        _billAmount == null) {
      return 0.0;
    } else {
      totalTip = (_tipPercentage * _billAmount) / 100;

      return totalTip.toStringAsFixed(2);
    }
  }

  totalAmount() {
    double totalAmount;
    totalAmount = (totalTip + _billAmount) / _personCounter;
    return totalAmount.toStringAsFixed(2);
  }
}
