import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
//import 'package:http_exception/http_exception.dart';
import 'http_exception.dart';
class Authentication with ChangeNotifier
{

  Future<void> signUp(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCINtiiDAmOVnZS3RkZc5nrt7gMHmUO9y0';

    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(
              {
                'email': email,
                'password': password,
                'returnSecureToken': true,
              }
          ));
      final responseData = json.decode(response.body);
//      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    }
     catch (error)
    {
      throw error;
    }

  }
  }
