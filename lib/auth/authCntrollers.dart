import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  bool isSign = false;

  String baseUrl = "https://blog-backend-foyt.onrender.com/";

  Future<void> signup(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    // print("------------------------ in signup");
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
          Uri.parse(baseUrl + "/user/singup"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body:
              jsonEncode({'name': name, 'email': email, 'password': password}));
      // print("------------------------> ${response.statusCode}");
      if (response.statusCode == 200) {
        isLoading = false;
        isSign = true;
        Navigator.of(context).pop();
        notifyListeners();
        print("--------------------------------------------> ${response.body}");
      } else {
        isLoading = false;
        isSign = false;
        notifyListeners();
        print("--------------------------------------------> ${response.body}");
      }
    } catch (e) {
      isLoading = false;
      isSign = false;
      notifyListeners();
      print("-----------------------------------> error is ${e}");
    }
  }

  Future<void> login({required String email, required String password}) async {
    // print("------------------------ in signup");
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(Uri.parse(baseUrl + "/user/login"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'email': email, 'password': password}));
      // print("------------------------> ${response.statusCode}");
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        print("--------------------------------------------> ${response.body}");
      } else {
        isLoading = false;
        notifyListeners();
        print("--------------------------------------------> ${response.body}");
      }
    } catch (e) {
      print("-----------------------------------> error is ${e}");
    }
  }
}
