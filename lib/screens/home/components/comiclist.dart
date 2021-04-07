import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ComicMania/screens/comicss/comic.dart';
Future<Widget> _getImage(BuildContext context,String imageName) async{
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value){
    image=Image.network(
      value.toString(),
      fit: BoxFit.scaleDown,
    );
  });
  return image;
}
class ComicList extends StatelessWidget {
  getimage() async {
    final ref = FirebaseStorage.instance.ref().child('Comic1/001.png');
    var durl = await ref.getDownloadURL();
    var url1=durl.toString();
    //print(url);
    return url1;
  }

  //Future<Widget> image=_getImage(context,"001.png");

  //static String routeName = "/Comic";
  //getimage();
  //final ref = FirebaseStorage.instance.ref().child('Comic1/001.png');
  @override
  Widget build(BuildContext context) {
    Future<Widget> image=_getImage(context,"https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/Comic1%2F001.png?alt=media&token=410da85b-a1f5-4c0c-9991-a76d0d9d662c");
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
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child:  Card(
                  margin: EdgeInsets.all(0),
                  child: Column(
                  children: <Widget>[
                  ListTile(
                  leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: (Solo.data()['photo'] != null)? Image.network(Solo.data()['photo']).image : Image.network('https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/Comic1%2F001.png?alt=media&token=410da85b-a1f5-4c0c-9991-a76d0d9d662c').image,
                  ),
                  title: GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> Comics()));
                    },
                      child: Text('${Solo.data()['Name']}',)
                  ),
                  subtitle: Text('${Solo.data()['desc']}'),
                  ),
                  ButtonBar(
                  children: <Widget>[
                    IconButton(onPressed: null, icon: Icon(Icons.favorite_border),
                  alignment: Alignment(-60,0),

                  ),
                  IconButton(
                  icon: Icon(Icons.add_comment),
                  color: Colors.lightBlue,
                  alignment: Alignment(-60, 0),
                  onPressed: null,
                  ),
                  Solo.data()['photo']!= null ? IconButton(icon: Icon(Icons.book), onPressed: null,  color: Colors.black,
                  alignment: Alignment(10,0),): null,
                  ],
                  )
                    ],
                  ),),),],);
                  return Card(
                    child: ListTile(
                      leading: Text('${Solo.data()['desc']}'),//Image.network(image.toString()), //Image('${Solo.data()['photo']}'),
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
class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context,String Image) async{
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}