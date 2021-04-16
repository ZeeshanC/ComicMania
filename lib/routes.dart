import 'package:ComicMania/screens/comicss/comic.dart';
import 'package:ComicMania/screens/comicss/solo/chap1/chap1.dart';
import 'package:ComicMania/screens/creator_upload/upload.dart';
import 'package:flutter/widgets.dart';
import 'package:ComicMania/screens/complete_profile/complete_profile_screen.dart';
import 'package:ComicMania/screens/details/details_screen.dart';
import 'package:ComicMania/screens/forgot_password/forgot_password_screen.dart';
import 'package:ComicMania/screens/home/home_screen.dart';
import 'package:ComicMania/screens/login_success/login_success_screen.dart';
import 'package:ComicMania/screens/profile/profile_screen.dart';
import 'package:ComicMania/screens/sign_in/sign_in_screen.dart';
import 'package:ComicMania/screens/splash/splash_screen.dart';
import 'package:ComicMania/screens/creator_sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/creator_sign_up/sign_up_screen.dart';
import 'screens/creator_upload/upload.dart';
//import 'screens/home/components/categories.dart';
// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CreatorSignInScreen.routeName:(context)=> CreatorSignInScreen(),
  CreatorSignUpScreen.routeName:(context)=>CreatorSignUpScreen(),
  //Zeeshan.routeName:(context)=>Zeeshan(),
  Comics.routeName:(context)=>Comics(),
  chap1.routeName:(context)=>chap1(),
  UserComic.routeName:(context)=>UserComic(),
};
