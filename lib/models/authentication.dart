import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_exception/http_exception.dart';

class Authentication with ChangeNotifier
{

  Future<void> signUp(String email, String password,String confirmPassword) async
  {
    String url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCINtiiDAmOVnZS3RkZc5nrt7gMHmUO9y0';

    try{
      final response = await http.post(Uri.parse(url), body: json.encode(
          {
            'email' : email,
            'password' : password,
            'confirm_password':confirmPassword,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);
//      print(responseData);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }

    } catch (error)
    {
      throw error;
    }

  }

  Future<void> logIn(String email, String password,String confirmPassword) async
  {
    String url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[YOUR KEY]';

    try{
      final response = await http.post(Uri.parse(url), body: json.encode(
          {
            'email' : email,
            'password' : password,
            'confirm_password':confirmPassword,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
//      print(responseData);

    } catch(error)
    {
      throw error;
    }

  }
}