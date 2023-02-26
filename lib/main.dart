import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TemperatureConverter()));
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _inputValue = 0.0;
  double _outputValue = 0.0;
  String _inputUnit = "Celsius";
  String _outputUnit = "Fahrenheit";
  TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Enter a temperature in $_inputUnit:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter temperature...",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _inputValue = double.parse(value);
                    _outputValue =
                        _convert(_inputValue, _inputUnit, _outputUnit);
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                "Convert to $_outputUnit:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                _outputValue.toStringAsFixed(2),
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDropdownButton(_inputUnit, (value) {
                    setState(() {
                      _inputUnit = value ?? "";
                      _outputValue =
                          _convert(_inputValue, _inputUnit, _outputUnit);
                    });
                  }),
                  SizedBox(width: 20),
                  _buildDropdownButton(_outputUnit, (value) {
                    setState(() {
                      _outputUnit = value ?? "";
                      _outputValue =
                          _convert(_inputValue, _inputUnit, _outputUnit);
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String value, Function(String?) onChanged) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: [
        DropdownMenuItem<String>(
          value: "Celsius",
          child: Text("Celsius"),
        ),
        DropdownMenuItem<String>(
          value: "Fahrenheit",
          child: Text("Fahrenheit"),
        ),
        DropdownMenuItem<String>(
          value: "Kelvin",
          child: Text("Kelvin"),
        ),
      ],
    );
  }

  double _convert(double value, String inputUnit, String outputUnit) {
    if (inputUnit == "Celsius") {
      if (outputUnit == "Fahrenheit") {
        return (value * 9 / 5) + 32;
      } else if (outputUnit == "Kelvin") {
        return value + 273.15;
      }
    } else if (inputUnit == "Fahrenheit") {
      if (outputUnit == "Celsius") {
        return (value - 32) * 5 / 9;
      } else if (outputUnit == "Kelvin") {
        return (value + 459.67) * 5 / 9;
      }
    } else if (inputUnit == "Kelvin") {
      if (outputUnit == "Celsius") {
        return value - 273.15;
      } else if (outputUnit == "Fahrenheit") {
        return (value * 9 / 5) - 459.67;
      }
    }
    return 0;
  }
}
