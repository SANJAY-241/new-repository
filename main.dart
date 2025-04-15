import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double size = 0;
  String intputvalue = "";
  String calculatorvalue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                intputvalue,
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),

            calcbutton("clear", Colors.black),
            Column(
              children: [
                Row(
                  children: [
                    calcbutton("7", Colors.white38),
                    calcbutton("8", Colors.white38),
                    calcbutton("9", Colors.white38),
                    calcbutton("/", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: [
                    calcbutton("4", Colors.white38),
                    calcbutton("5", Colors.white38),
                    calcbutton("6", Colors.white38),
                    calcbutton("*", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: [
                    calcbutton("1", Colors.white38),
                    calcbutton("2", Colors.white38),
                    calcbutton("3", Colors.white38),
                    calcbutton("_", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: [
                    calcbutton("0", Colors.white38),
                    calcbutton(".", Colors.white38),
                    calcbutton("=", Colors.orangeAccent),
                    calcbutton("+", Colors.orangeAccent),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget calcbutton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "clear") {
          setState(() {
            intputvalue = "";
            calculatorvalue = "";
            operator = "";
          });
        } else if (text == "+" || text == "_" || text == "*" || text == "/") {
          setState(() {
            calculatorvalue = intputvalue;
            intputvalue = "";

            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(calculatorvalue);
            double input = double.parse(intputvalue);
            if (operator == "+") {
              intputvalue = (calc + input).toString();
            }
            if (operator == "_") {
              intputvalue = (calc - input).toString();
            }
            if (operator == "*") {
              intputvalue = (calc * input).toString();
            }
            if (operator == "/") {
              intputvalue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            intputvalue = intputvalue + text;
          });
        }
      },

      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(5),
        height: 80,
        width: 80,
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
