import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'home_header.dart';
import 'comiclist.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(0)),
            ComicList(),
            //SizedBox(height: getProportionateScreenWidth(0)),
            ComicList(),
            //SizedBox(height: getProportionateScreenWidth(20)),
            ComicList(),
            //SizedBox(height: getProportionateScreenWidth(20)),
            ComicList(),
            //SizedBox(height: getProportionateScreenWidth(20)),
            ComicList(),
          ],
        ),
      ),
    );
  }
}
