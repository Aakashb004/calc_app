import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String inputValue = "";
  String calcuValue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              // Display Area
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomRight,
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    inputValue,
                    style: const TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          calButton("7", Colors.white38, size),
                          calButton("8", Colors.white38, size),
                          calButton("9", Colors.white38, size),
                          calButton("/", Colors.orange, size),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          calButton("4", Colors.white38, size),
                          calButton("5", Colors.white38, size),
                          calButton("6", Colors.white38, size),
                          calButton("*", Colors.orange, size),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          calButton("1", Colors.white38, size),
                          calButton("2", Colors.white38, size),
                          calButton("3", Colors.white38, size),
                          calButton("-", Colors.orange, size),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          calButton("0", Colors.white38, size),
                          calButton(".", Colors.white38, size),
                          calButton("=", Colors.orange, size),
                          calButton("+", Colors.orange, size),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Center(child: calButton("Clear", Colors.black, size)),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget calButton(String text, Color backgroundColor, double size) {
    return InkWell(
      onTap: () {
        setState(() {
          if (text.toLowerCase() == "clear") {
            inputValue = "";
            calcuValue = "";
            operator = "";
          } else if (text == "+" || text == "-" || text == "*" || text == "/") {
            calcuValue = inputValue;
            inputValue = "";
            operator = text;
          } else if (text == "=") {
            double num1 = double.tryParse(calcuValue) ?? 0;
            double num2 = double.tryParse(inputValue) ?? 0;
            if (operator == "+") {
              inputValue = (num1 + num2).toString();
            } else if (operator == "-") {
              inputValue = (num1 - num2).toString();
            } else if (operator == "*") {
              inputValue = (num1 * num2).toString();
            } else if (operator == "/") {
              inputValue = num2 != 0 ? (num1 / num2).toString() : "Error";
            }
            operator = "";
            calcuValue = "";
          } else {
            inputValue += text;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: const EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
