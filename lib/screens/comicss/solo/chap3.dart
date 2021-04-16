import 'package:ComicMania/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class chap3 extends StatefulWidget {
  @override
  _chap3State createState() => _chap3State();
}

class _chap3State extends State<chap3> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  int index = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chap 3"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.book,
                  color: kPrimaryColor),
              onPressed: (){
                _pdfViewerKey.currentState?.openBookmarkView();
              }
          ),
        ],
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('Creator').doc('my comics').collection('AoT').get(),//.doc('Chapter 1').get(),
          builder: (context, snapshot) {
            DocumentSnapshot comic = snapshot.data.docs[index];
            if(snapshot.hasData && snapshot.connectionState == ConnectionState.done)

              {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SfPdfViewer.network(comic.data()['comicFile'],
                  //"https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/user%2FcPnn8WmG5FM79xEXvj3HpFVDL1H3%2FGet_Started_With_Smallpdf.pdf?alt=media&token=ac68377d-1443-47cf-9be5-59a9e9a90db4",
                        key: _pdfViewerKey,
                      ),
                      FlatButton(onPressed: ()=>print("hell"), child: Text("Next"),color: kPrimaryColor),
                    ],
                  ),
                );
              }
            else
              return Center(
                child:  CircularProgressIndicator(),
              );
          }
      ),
    );
  }
}
