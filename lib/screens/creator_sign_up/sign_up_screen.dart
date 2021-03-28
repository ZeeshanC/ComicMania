import 'package:flutter/material.dart';

import 'components/body.dart';

class CreatorSignUpScreen extends StatelessWidget {
  static String routeName = "/creator_sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creator Sign Up"),
      ),
      body: Body(),
    );
  }
}
