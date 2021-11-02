// ignore_for_file: unused_import, avoid_print, avoid_web_libraries_in_flutter, unused_element, non_constant_identifier_names, use_rethrow_when_possible

import 'package:fashapp/pages/login.dart';
import 'package:fashapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'http_exception.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Authentication with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  Future<void> Login(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDDq8Ht8aYlX-WPOAItho6hEd7vQlOKYt0';

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      // print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['errpr']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> Singup_Screen(String email, String password) async {
    const url =
        ' https://securetoken.googleapis.com/v1/token?key=AIzaSyDDq8Ht8aYlX-WPOAItho6hEd7vQlOKYt0';

    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      print(responseData['error'] != null);
      {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  static signOut() {}
}
