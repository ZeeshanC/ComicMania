import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ComicList extends StatelessWidget {
  //static String routeName = "/Comic";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection('user').get(),
        builder: (context, snapshot){
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done)
          {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index){
                  DocumentSnapshot user = snapshot.data.docs[index];
                  return Card(
                    child: ListTile(
                      leading: Text('${user.data()['name']}'),
                      trailing: Text('${user.data()['email']}'),
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
