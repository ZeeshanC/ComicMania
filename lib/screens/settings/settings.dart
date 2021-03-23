import 'package:flutter/material.dart';
class UserSettings extends StatelessWidget {
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Settings',
          textAlign: TextAlign.center,
          style:TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('All setting details here!'),
            ],
          )
      ),
    );
  }
}