import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BinaryConverter()));
}

class BinaryConverter extends StatefulWidget {
  @override
  _BinaryConverterState createState() => _BinaryConverterState();
}

class _BinaryConverterState extends State<BinaryConverter> {
  String _binaryValue = "";
  String _decimalValue = "";

  void _convertBinaryToDecimal() {
    int decimal = 0;
    int base = 1;

    for (int i = _binaryValue.length - 1; i >= 0; i--) {
      int digit = int.parse(_binaryValue[i]);
      decimal += digit * base;
      base *= 2;
    }

    setState(() {
      _decimalValue = decimal.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Binary Converter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter a binary number",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _binaryValue = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: _convertBinaryToDecimal,
              child: Text("Convert"),
            ),
            SizedBox(height: 16),
            Text(
              "Decimal value: $_decimalValue",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
