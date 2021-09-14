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
          title: Text(
            "Appbar",
            style: TextStyle(fontSize: 30, color: Colors.yellow),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
          flexibleSpace: Center(child: Icon(Icons.camera)),
          /*bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Text("Nagaraj"),

          ),*/
        ),
        body: Center(
          child: Text(
            "Body Demo",
            style: TextStyle(fontSize: 30, color: Colors.pink),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blueAccent,
          onPressed: () {},
          elevation: 35.0,
          splashColor: Colors.greenAccent,
        ),
        drawer: Drawer(
          elevation: 30.0,
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Test App"),
                accountEmail: Text("TestApp@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.cyanAccent,
                  child: Text("Pic"),
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.cyanAccent,
                    child: Text("Pic"),
                  )
                ],
              ),
              ListTile(
                  title: Text("Power on"),
                  leading: IconButton(
                    icon: Icon(Icons.offline_bolt),
                    onPressed: () {},
                  )),
              Divider(
                height: 15,
              ),
              ListTile(
                  title: Text("Power Off"),
                  leading: IconButton(
                    icon: Icon(Icons.power_settings_new),
                    onPressed: () {},
                  )),
              Divider(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
