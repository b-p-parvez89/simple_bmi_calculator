import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 170.0; // Initial height in centimeters
  double weight = 70.0; // Initial weight in kilograms
  double bmi = 0.0;

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter your height (cm):',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Height"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        height = double.parse(value);
                      });
                    },
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Enter your weight (kg):',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Weight"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        weight = double.parse(value);
                      });
                    },
                  ),
                ],
              )),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: const Text('Calculate BMI'),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Your BMI is: $bmi',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
