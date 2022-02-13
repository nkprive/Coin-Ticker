import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class ValutaPicker extends StatefulWidget {
  final Function onChanged;

  const ValutaPicker({this.onChanged});

  @override
  _ValutaPickerState createState() => _ValutaPickerState();
}

class _ValutaPickerState extends State<ValutaPicker> {
  String selectedCurrency = "USD";

  Widget renderAndroidPicker() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      items.add(
        DropdownMenuItem(
          child: Text(
            currency,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          value: currency,
        ),
      );
    }

    return Center(
      child: DropdownButton(
        value: selectedCurrency,
        dropdownColor: Color(0xff222B45),
        items: items,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
          });
        },
      ),
    );
  }

  Widget renderIosPicker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(
        Text(
          currency,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      );
    }

    // iOS-specific code
    return CupertinoPicker(
      itemExtent: 30,
      diameterRatio: 1,
      useMagnifier: true,
      magnification: 1.2,
      squeeze: 2,
      scrollController: FixedExtentScrollController(initialItem: 0),
      children: items,
      onSelectedItemChanged: (value) {
        setState(() {
          setState(() {
            selectedCurrency = currenciesList[value];
          });
        });

        widget.onChanged(currenciesList[value]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //Here goes the same radius, u can put into a var or function
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment
                  .bottomRight, // 10% of the width, so there are ten blinds.
              colors: <Color>[
                Color(0xff222B45),
                Color(0xff07090F)
              ], // red to yellow
              // tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: Platform.isIOS ? renderIosPicker() : renderAndroidPicker(),
        ),
      ),
    );
  }
}
