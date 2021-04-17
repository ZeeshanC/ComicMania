import 'package:ComicMania/constants.dart';
import 'package:ComicMania/screens/comicss/solo/chap3.dart';
import 'package:flutter/material.dart';

import 'chap1/chap1.dart';
class chap2 extends StatelessWidget {
  static String routeName='/chap2';
  List a =[
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F002.png?alt=media&token=5248c104-0b68-4cf0-8e15-782ce807f2f8',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F003.png?alt=media&token=3efe015b-4c88-49a9-964f-6dea57eb86bf',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F004.png?alt=media&token=948ac442-2459-47c9-a2a2-02a42120437c',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F005.png?alt=media&token=b480d923-0693-40f0-bb12-2e4b62010ff8',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F006.png?alt=media&token=0a04d5a1-5ebe-43db-a8db-4f1d6e761bc8',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F007.png?alt=media&token=17a719d6-e70c-4325-b642-e172ec2c49e5',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F010.png?alt=media&token=9ccdcd66-f6bb-43f1-8401-bebf4207803e',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F008.png?alt=media&token=ac0e6ca4-85ae-4bbe-b491-b1175018c735',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F009.png?alt=media&token=c156f873-96e2-4581-9f4c-9b98ef25bd60',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F010.png?alt=media&token=c4d921a3-ba3f-422f-bfce-637b5e278afd',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F011.png?alt=media&token=607df3ad-ee1c-44ad-8431-ac9af7f180c9',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F012.png?alt=media&token=aee33778-86c4-4860-b439-b5926959e169',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F013.png?alt=media&token=a42dbc40-83cd-413e-9e3e-ad7dbbc91e34',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F014.png?alt=media&token=756b9d62-4ce7-45bf-9abd-e0ef9c9d8e76',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F015.png?alt=media&token=b7dd6804-6e2e-4621-871f-a9a0a370837a',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F016.png?alt=media&token=82be7c4d-b072-4bf5-baf5-2daf1b30fc6f',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F017.png?alt=media&token=a30301a6-1f4e-40a4-99f0-f825de1494d8',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F018.png?alt=media&token=e8271a7b-90c2-4a9c-8936-8cb8394f7e95',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F019.png?alt=media&token=35c05e3a-fa9c-4c6a-bc4b-35a6912e5dd6',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F020.png?alt=media&token=339cda36-252f-4a9d-9fba-a3220f500e11',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F021.png?alt=media&token=a6cfc748-5e08-4dea-874a-d39e2ab1b97e',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F022.png?alt=media&token=7187de38-af13-4174-9486-9ba3d6c6ee4f',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F023.png?alt=media&token=87bb2710-fbf9-4c3e-bcb3-a4723a16671f',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/3%2F024.png?alt=media&token=ccf5b9d9-4895-4724-bdcd-95391096737c',
  ];
  @override
  Widget build(BuildContext context) {
    final _itemExtent = 56.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Chapter 2"),
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                controller: ScrollController(initialScrollOffset: _itemExtent * 401),
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx,int index){
                  return Image.network(a[index]);
                },
                itemCount: a.length,
              ),
            ),
            Center(
              child: Column(
                children: [
                  FlatButton(onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> chap1())), child: Text("Prev")),
                  FlatButton(
                      onPressed:()=>Navigator.push(context,MaterialPageRoute(builder: (context)=> chap3())),
                      child: Text('Next'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
