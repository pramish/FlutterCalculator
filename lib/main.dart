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
  void addNumber() {
    setState(() {
      finalNumber = firstNumber + secondNumber;
    });
  }

  void subtractNumber() {
    setState(() {
      finalNumber = firstNumber - secondNumber;
    });
  }

  void multiplyNumber() {
    setState(() {
      finalNumber = firstNumber * secondNumber;
    });
  }

  void divideNumber() {
    setState(() {
      finalNumber = firstNumber ~/ secondNumber;
    });
  }

  void generateRandomNumber() {
    setState(() {
      finalNumber = 0;
      var number = new Random();
      firstNumber = number.nextInt(1000);
      secondNumber = number.nextInt(1000);
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
                    onPressed: addNumber,
                    tooltip: "Add two numbers",
                  ),
                  IconButton(
                    icon: Icon(Icons.access_alarm),
                    onPressed: divideNumber,
                    tooltip: "Divide two numbers",
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: subtractNumber,
                    tooltip: "Subtract two numbers",
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: multiplyNumber,
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
