import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text("Flutter Calculator"),
        ),
        body: CalculatorWidget(),
      ),
    );
  }
}

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  int firstNumber = 0;
  int secondNumber = 0;
  int finalNumber = 0;

  void operatorPressed(String sign) {
    setState(() {
      switch (sign) {
        case "+":
          finalNumber = firstNumber + secondNumber;
          break;
        case "-":
          finalNumber = firstNumber - secondNumber;
          break;
        case "/":
          finalNumber = firstNumber ~/ secondNumber;
          break;
        case "x":
          finalNumber = firstNumber * secondNumber;
          break;
      }
    });
  }

  void generateRandomNumber() {
    setState(() {
      finalNumber = 0;
      var number = new Random();
      firstNumber = number.nextInt(100);
      secondNumber = number.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100, 100, 100, 100),
      child: Column(
        children: <Widget>[
          FlatButton(
            textColor: Colors.white,
            padding: EdgeInsets.all(10),
            splashColor: Colors.blue,
            color: Colors.red,
            child: Text("Generate Number"),
            onPressed: generateRandomNumber,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("First Number: "),
                  Text('$firstNumber')
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Second Number: "),
                  Text('$secondNumber')
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => operatorPressed("+"),
                    tooltip: "Add two numbers",
                  ),
                  IconButton(
                    icon: Icon(Icons.access_alarm),
                    onPressed: () => operatorPressed("/"),
                    tooltip: "Divide two numbers",
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => operatorPressed("-"),
                    tooltip: "Subtract two numbers",
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => operatorPressed("x"),
                    tooltip: "Multiple two numbers",
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Final result: "),
                  Text('$finalNumber')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
