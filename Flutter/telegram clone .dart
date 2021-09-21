import 'package:flutter/material.dart';

void main() {
  runApp(Mini());
}

class Mini extends StatefulWidget {
  const Mini({Key? key}) : super(key: key);

  @override
  _MiniState createState() => _MiniState();
}

class _MiniState extends State<Mini> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Telegram",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Nagarasu.P"),
                accountEmail: Text("+91 9876543210"),
                otherAccountsPictures: <Widget>[],
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/b3/d4/fc/b3d4fc2e-cc8d-72c6-1ed6-6b12f6a348b2/source/512x512bb.jpg",
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                title: Text(
                  "Add Account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.group),
                  onPressed: () {},
                ),
                title: Text(
                  "New Group",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.contacts),
                  onPressed: () {},
                ),
                title: Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.call_sharp),
                  onPressed: () {},
                ),
                title: Text(
                  "Calls",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.emoji_people_outlined),
                  onPressed: () {},
                ),
                title: Text(
                  "People Nearby",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.bookmark),
                  onPressed: () {},
                ),
                title: Text(
                  "Saved Massages",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.group_add),
                  onPressed: () {},
                ),
                title: Text(
                  "Invite Friends",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.help),
                  onPressed: () {},
                ),
                title: Text(
                  "Telegram Features",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Click me"),
            color: Colors.blue,
            splashColor: Colors.green,
            onPressed: () {},
            elevation: 30.5,
            padding: EdgeInsets.all(25.9),
            textColor: Colors.white,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            icon: Icon(Icons.create),
            onPressed: () {},
            splashColor: Colors.pink,
          ),
          elevation: 30.0,
        ),
      ),
    );
  }
}
