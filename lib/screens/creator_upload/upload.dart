import 'dart:io';
import 'package:ComicMania/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserComic extends StatefulWidget {
  static String routeName = "/upload";
  @override
  _UserComicState createState() => _UserComicState();
}

class _UserComicState extends State<UserComic> {
  String post;
  User user = FirebaseAuth.instance.currentUser;
  bool uploadedFile = false;
  TextEditingController vibeController = new TextEditingController();
  String downloadURL;
  FilePickerResult getComicFile;

  getPost(post){
    this.post = post;
  }
  final _formkey = GlobalKey<FormState>();

  Future Comicupload() async{
    DocumentReference ds = FirebaseFirestore.instance.collection('Creator').doc('my comics').collection('AoT').doc('Chapter 1');
    DocumentReference ds1 = FirebaseFirestore.instance.collection('user').doc(user.uid).collection('post').doc(Timestamp.now().toDate().toString());
    DocumentReference ds2 = FirebaseFirestore.instance.collection('user').doc(user.uid).collection('Comics').doc();
    if(uploadedFile == false )
    {
      Map <String, dynamic> userPost={
        'time': Timestamp.now().toDate(),
      };
      ds.set(userPost).whenComplete(() => print("Posted!"));
      //ds1.set(userPost).whenComplete(() => print("Saved in user's personal file"));
    }
    else if(uploadedFile == true )
    {
      File comicFile = File(getComicFile.files.single.path);
      var storageReference = FirebaseStorage.instance.ref().child(
          "user/${FirebaseAuth.instance.currentUser.uid}/${getComicFile.files.single.name}");
      var uploadTask = storageReference.putFile(comicFile);
      await uploadTask.whenComplete(()async{
        var completedTask =  uploadTask.snapshot;
        downloadURL = await completedTask.ref.getDownloadURL();
      });
      print(downloadURL);
      Map <String, dynamic> userPost={
        'time': Timestamp.now().toDate(),
        'uid': user.uid,
        'comicFile': downloadURL,
      };

      //ds.set(userPost).whenComplete(() => print("Posted with file!"));
      //ds1.set(userPost).whenComplete(() => print("Saved in user's personal file"));
      ds.set(userPost).whenComplete(() => print("Saved in user's Comicrepo"));
    }

  }

  checkUploadComic() async
  {
    getComicFile = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['.pdf']);
    if (getComicFile != null) {
      setState(() {
        uploadedFile = true;
      });
      print(getComicFile.files.single.path);
      Fluttertoast.showToast(
          msg: "File Uploaded ${getComicFile.files.single.path}");
    }
    else {
      print("User failed to upload comic");
      Fluttertoast.showToast(
          msg: "Failed to ${getComicFile.files.single.path}");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 30,),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ComicMania", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            RaisedButton(
              onPressed: checkUploadComic,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Select Comic"),
                  SizedBox(width: 10,),
                  Icon(Icons.book),
                ],
              ),

              color: kPrimaryColor,
            ),
            RaisedButton(
              onPressed: (){
                Comicupload().then((value) => Navigator.pop(context));
              },
              child: Text("Upload"),
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}