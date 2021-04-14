import 'package:ComicMania/constants.dart';
import 'package:flutter/material.dart';

import '../chap2.dart';
class chap1 extends StatelessWidget {
  static String routeName='/chap1';
  List a =[
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F002.png?alt=media&token=4975428d-fc47-4958-b5e3-3eea2de19c64',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F003.png?alt=media&token=da6a1461-e82c-4b4d-8f6f-abf5c1bc64c2',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F004.png?alt=media&token=822f81ad-bf80-49f5-9bb3-e175874e102c',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F005.png?alt=media&token=00dfdf5a-e276-4f51-9f6a-a4e1676f418d',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F006.png?alt=media&token=0a04d5a1-5ebe-43db-a8db-4f1d6e761bc8',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F007.png?alt=media&token=4b2dc98a-04b2-4e53-8ee2-09297d571d83',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F010.png?alt=media&token=9ccdcd66-f6bb-43f1-8401-bebf4207803e',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F012.png?alt=media&token=1393e275-959b-4215-9e33-10c94eddbd12',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F013.png?alt=media&token=cbef12db-0a91-41e8-bbda-565009a33f26',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F014.png?alt=media&token=03336e12-09c9-42c0-a2cd-e32511e2169e',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F015.png?alt=media&token=ec5332a7-f280-4d71-8ecc-2503b9826776',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F016.png?alt=media&token=47111434-14f8-4c62-a2bb-1b3237179a3f',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F019.png?alt=media&token=14faa6b6-8da3-436c-87f8-c74cc461cccb',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F020.png?alt=media&token=b30544d5-26ff-448f-836e-49037f1fd872',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F021.png?alt=media&token=56e2afbe-684f-4d51-bfe2-c063c11cb856',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F023.png?alt=media&token=01ec8b58-3456-430b-aaec-3d89f5e6ab07',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F024.png?alt=media&token=3169a029-7d6a-4e49-8744-cf572439b978',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F025.png?alt=media&token=8aa045a3-51bb-4fae-a885-9aa964a56643',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F026.png?alt=media&token=bc49d740-d55c-4da7-9909-91d1e869b233',
    'https://firebasestorage.googleapis.com/v0/b/comicmania-fc715.appspot.com/o/2%2F027.png?alt=media&token=89a07c80-714d-4c2b-a9bb-7a6ac7e03443',
  ];
  @override
  Widget build(BuildContext context) {
    final _itemExtent = 56.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Chapter 1"),
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
            FlatButton(
                onPressed:()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> chap2())),
                child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
