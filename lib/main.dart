import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String num1 = "";
  String num2 = "";
  String operand = "";
  double result = 0.0;

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      output = "0";
      num1 = "";
      num2 = "";
      operand = "";
      result = 0.0;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = output;
      operand = buttonText;
      output = "0";
    } else if (buttonText == ".") {
      if (output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        output = output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = output;
      double number1 = double.parse(num1);
      double number2 = double.parse(num2);

      if (operand == "+") {
        result = number1 + number2;
      }
      if (operand == "-") {
        result = number1 - number2;
      }
      if (operand == "*") {
        result = number1 * number2;
      }
      if (operand == "/") {
        result = number1 / number2;
      }

      output = result.toString();
      num1 = "";
      num2 = "";
      operand = "";
    } else {
      output = output + buttonText;
    }

    setState(() {
      output = output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("CLEAR"),
                buildButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
