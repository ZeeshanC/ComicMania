import 'package:ComicMania/constants.dart';
import 'package:flutter/material.dart';

class DropDownNotification extends StatefulWidget {
  @override
  _DropDownNotificationState createState() => _DropDownNotificationState();
}

class _DropDownNotificationState extends State<DropDownNotification> {
  bool seeAll;
  @override
  void initState() {
    // TODO: implement initState
    seeAll = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDown Notifications'),
        backgroundColor: kPrimaryColor,
        actions: [
          PopupMenuButton(
            itemBuilder: (context)=> [
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle, color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Notification 1"),
                      )
                    ],
                  )
              ),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle, color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Notification 2"),
                      )
                    ],
                  )
              ),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle, color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Notification 3"),
                      )
                    ],
                  )
              ),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle, color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Notification 4"),
                      )
                    ],
                  )
              ),
              PopupMenuItem(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        seeAll = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add_outlined, color: Colors.black,),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("See all"),
                        )
                      ],
                    ),
                  )
              )

            ],
            icon: Icon(Icons.notifications, color: Colors.white,),
          )
        ],
      ),
      body: seeAll == false?
      Center(
        child: Text("Press the notification Icon on top right and then press see all"),
      ):
      Container(
          padding: EdgeInsets.only(top: 10),
          child:ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.supervised_user_circle),
                    title: Text("Notification ${index+1}"),
                  ),
                );
              }
          )
      ),
    );
  }
}