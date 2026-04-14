import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}


class _HomeState extends State<Homepage> {
  
  String title = "Homepage";
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  double sum = 0;
  double difference = 0;
  double product = 0;


  @override
  void initState() {
    title = "Welcome to My Homepage";
    number1.text = "0";
    number2.text = "0";
    super.initState();
  }

  void addNumbers() {
    setState(() {
      sum = double.parse(number1.text) + double.parse(number2.text);
    });
  }

  void subtractNumbers() {
    setState(() {
      difference = double.parse(number1.text) - double.parse(number2.text);
    });
  }

  void multiplyNumbers() {
    setState(() {
      product = double.parse(number1.text) * double.parse(number2.text);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20
              ),
            TextField(
              controller: number1,
              decoration: InputDecoration(
                hintText: "Enter first number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10
              ),
            TextField(
              controller: number2,
              decoration: InputDecoration(
                hintText: "Enter second number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: addNumbers,
                  child: Text("Add"),
                ),
                SizedBox(
                  width: 10
                  ),
                ElevatedButton(
                  onPressed: subtractNumbers,
                  child: Text("Subtract"),
                ),
                SizedBox(
                  width: 10
                  ),
                ElevatedButton(
                  onPressed: multiplyNumbers,
                  child: Text("Multiply"),
                ),
              ],
            ),
            SizedBox(
              height: 10
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sum: $sum"),
                SizedBox(
                  width: 20
                ),
                Text("Difference: $difference"),
                SizedBox(
                  width: 20
                ),
                Text("Product: $product"),
              ],
            ),
          ],
        ),
      ),

    );
  }
}