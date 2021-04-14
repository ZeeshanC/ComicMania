import 'package:ComicMania/constants.dart';
import 'package:ComicMania/screens/comicss/solo/chap2.dart';
import 'package:flutter/material.dart';
import 'package:ComicMania/screens/comicss/solo/chap1/chap1.dart';
class Comics extends StatelessWidget {
  static String routeName = "/Solo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Solo leveling',
        style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            child: Text("Chapter 1"),
            onTap: (){
              print("chap1");
              Navigator.push(context,MaterialPageRoute(builder: (context)=> chap1()));
            },
          ),
          new InkWell(
            child: Text("Chapter 2"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> chap2()));
            },
          )
        ],
      ),
    );
  }
}
