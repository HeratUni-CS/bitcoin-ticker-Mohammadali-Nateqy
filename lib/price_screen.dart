import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String defaultValue = 'AF';

  DropdownButton<String> androidDropDownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String unit = currenciesList[i];
      var NewItems = DropdownMenuItem(
        child: Text(unit),
        value: unit,
      );
      dropdownItems.add(NewItems);
    }

    return DropdownButton(
      value: defaultValue,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          defaultValue = value!;
        });
      },
    );
  }

  CupertinoPicker IOSDropDownButton() {
    List<Text> pickderList = [];
    for (String currency in currenciesList) {
      pickderList.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 30.0,
      onSelectedItemChanged: (selectedItems) {
        print(selectedItems);
      },
      children: pickderList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid
                ? androidDropDownButton()
                : IOSDropDownButton(),
          ),
        ],
      ),
    );
  }
}
