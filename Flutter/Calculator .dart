import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 60.5,
                  fontWeight: FontWeight.w200,
                  color: Colors.lightGreen,
                ),
              ),
            )),
            Row(
              children: <Widget>[
                customOutlinedButton("9"),
                customOutlinedButton("8"),
                customOutlinedButton("7"),
                customOutlinedButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("6"),
                customOutlinedButton("5"),
                customOutlinedButton("4"),
                customOutlinedButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("3"),
                customOutlinedButton("2"),
                customOutlinedButton("1"),
                customOutlinedButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("C"),
                customOutlinedButton("0"),
                customOutlinedButton("="),
                customOutlinedButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlinedButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => clickme(value),
        child: Text(
          "$value",
          style: TextStyle(
            fontSize: 50.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  late int first, second;
  late String result, text = "";
  late String Symbol;
  void clickme(String Number) {
    if (Number == "C") {
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (Number == "+" ||
        Number == "-" ||
        Number == "x" ||
        Number == "/") {
      first = int.parse(text);
      result = "";
      Symbol = Number;
    } else if (Number == "=") {
      second = int.parse(text);
      if (Symbol == "+") {
        result = (first + second).toString();
      }
      if (Symbol == "-") {
        result = (first - second).toString();
      }
      if (Symbol == "x") {
        result = (first * second).toString();
      }
      if (Symbol == "/") {
        result = (first / second).toString();
      }
    } else {
      result = int.parse(text + Number).toString();
    }
    setState(() {
      text = result;
    });
  }
}
