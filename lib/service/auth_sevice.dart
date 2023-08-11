import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socialmedia/model/auht_model.dart';
Future<String> registerservice(String username, String password, String email, Function navigateLogin) async {
  try {
    Map<String, String> authregister = {
      "username": username,
      "password": password,
      "email": email,
    };
    var body = json.encode(authregister);
    final response = await http.post(Uri.parse("http://localhost:3000/auth/register"),
    headers: <String,String> {
 'Content-Type': 'application/json; charset=UTF-8', 
 }
    , body: body);

   if (response.statusCode == 201) {
  Map<String, dynamic> jsonResponse = json.decode(response.body);
  String message = jsonResponse["message"];
  await Future.delayed(Duration(seconds: 3));
     navigateLogin();
  return message;
} else {
  throw Exception("API request failed with status code ${response.statusCode}");
}
  }catch (e) {
  throw Exception(e);
}
}
Future<Login> loginservice(String email,String password) async{
  try {
    Map<String,String> loginbody = {
      "email" : email,
      "password": password
    };
    var body = json.encode(loginbody);
    final responseLogin = await http.post(Uri.parse("http://localhost:3000/auth/login"),
    headers: <String,String> {
     'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body
    );
   Map<String, dynamic> jsonResponse = json.decode(responseLogin.body);   
  return Login.fromJson(jsonResponse);


  } catch (e) {
    throw Exception(e);
  }
}


