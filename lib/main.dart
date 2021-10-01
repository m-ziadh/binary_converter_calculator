import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white12,
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Binary Converter',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              backgroundColor: Colors.black,
            ),
            body: const ButtonFunc(),
          ),
        ),
      ),
    );
  });
}

class ButtonFunc extends StatefulWidget {
  const ButtonFunc({Key? key}) : super(key: key);
  @override
  _ButtonFuncState createState() => _ButtonFuncState();
}

class _ButtonFuncState extends State<ButtonFunc> {
  bool check = false;
  String displayValue = '0';

  Expanded DigitButton(String keyNumber) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextButton(
          onPressed: () {
            setState(() {
              if (keyNumber == 'C') {
                displayValue = '0';
              } else if (keyNumber == '=' && check == false) {
                displayValue = int.parse(displayValue).toRadixString(2);
                check = true;
              } else if (displayValue == '0' &&
                  keyNumber != 'C' &&
                  keyNumber != '=') {
                displayValue = keyNumber;
                check = false;
              } else if (keyNumber != 'C' && keyNumber != '=') {
                if (check) {
                  displayValue = keyNumber;
                  check = false;
                } else {
                  displayValue = displayValue + keyNumber;
                }
              }
            });
          },
          child: Text(keyNumber),
          style: TextButton.styleFrom(
            backgroundColor: Colors.black87,
            padding: const EdgeInsets.all(20.0),
            primary: Colors.deepOrange,
            textStyle: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }

  Expanded Display() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 100.0),
        child: Container(
          color: Colors.black87,
          child: Center(
            child: Text(
              displayValue,
              style: const TextStyle(
                color: Colors.deepOrange,
                fontSize: 50.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Display(),
        Row(
          children: [
            DigitButton('1'),
            DigitButton('2'),
            DigitButton('3'),
          ],
        ),
        Row(
          children: [
            DigitButton('4'),
            DigitButton('5'),
            DigitButton('6'),
          ],
        ),
        Row(
          children: [
            DigitButton('7'),
            DigitButton('8'),
            DigitButton('9'),
          ],
        ),
        Row(
          children: [
            DigitButton('C'),
            DigitButton('0'),
            DigitButton('='),
          ],
        ),
      ],
    );
  }
}
