import 'package:ComicMania/screens/accountpage/accountpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ComicMania/screens/settings/settings.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:ComicMania/screens/sign_in/sign_in_screen.dart';
import 'package:ComicMania/bloc/auth_bloc.dart';
class Body extends StatelessWidget {
  var authBloc =new AuthBloc();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () async {
              //Navigator.of(context).pushReplacementNamed(UserSettings.routeName);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UserSettings()));
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async{
              authBloc.logout();
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignInScreen()));
            },
          ),
        ],
      ),
    );
  }
}
