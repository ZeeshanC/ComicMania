import 'package:flutter/material.dart';

import 'components/body.dart';

class CreatorSignInScreen extends StatelessWidget {
  static String routeName = "/creator_sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creator Sign In"),
      ),
      body: Body(),
    );
  }
}
