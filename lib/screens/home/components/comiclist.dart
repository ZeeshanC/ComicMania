import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ComicList extends StatelessWidget {
  //static String routeName = "/Comic";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection('Solo').get(),
        builder: (context, snapshot){
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done)
          {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index){
                  DocumentSnapshot Solo = snapshot.data.docs[index];
                  return Card(
                    child: ListTile(
                      leading: Text('${Solo.data()['photo']}'),
                      trailing: Text('${Solo.data()['Name']}'),
                    ),
                  );
                }
            );
          }
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}
