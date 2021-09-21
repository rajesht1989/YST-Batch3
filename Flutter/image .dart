import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://m.media-amazon.com/images/I/816a43cmXmL._SL1500_.jpg"),
                  fit: BoxFit.fill),
            ),

            /*child: Image.network(
                "data:image/jpeg;base64,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",
                width: double.infinity,
              ),*/
            child: Column(
              children: [
                Text(
                  "Baby Boy",
                  style: TextStyle(
                    fontSize: 20.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
