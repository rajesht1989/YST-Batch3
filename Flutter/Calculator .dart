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
        title:
            /* backgroundColor: Colors.white,
          title: Image(
            image: NetworkImage(
                "https://i1.wp.com/gwjeel.com/wp-content/uploads/2018/04/pexels-photo-443446.jpeg?fit=739%2C478&ssl=1"),
          )*/
            Text(
          "Calculator",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomRight,
              color: Colors.white,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 60.5,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              ),
            )),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.red,
                ),
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
      child: Container(
        margin: EdgeInsets.all(4),
        height: 80.0,
        width: double.infinity,
        decoration: BoxDecoration(
          /* borderRadius: BorderRadius.all(Radius.circular(300.99)),*/
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              "data:image/jpeg;base64,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",
            ),
          ),
        ),
        child: OutlinedButton(
          onPressed: () => clickme(value),
          child: Text(
            "$value",
            style: TextStyle(
              fontSize: 50.5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
      ),
    );
  }
}
