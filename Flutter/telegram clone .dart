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
                  child: Text("Xyz"),
                  backgroundColor: Colors.white,
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
          child: Text(
            "Add Contact and Continue Chat",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.amber,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            icon: Icon(Icons.create),
            onPressed: () {},
          ),
          elevation: 30.0,
        ),
      ),
    );
  }
}
