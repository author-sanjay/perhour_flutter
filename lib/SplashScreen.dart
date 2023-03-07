import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/Home/Home.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/Screens/Login/Login.dart';
import 'package:perhour_flutter/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static String? id;
  Future getvalidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    id = sharedPreferences.getString("uid");
  }

  @override
  void initState() {
    getvalidation().whenComplete(() async {
      if (id == null) {
        Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          ),
        );
      } else {
        Timer(Duration(seconds: 2), () async {
          var res = await http.get(Uri.parse("${api}users/getuser/${id}"),
              headers: headers);
          var result = jsonDecode(res.body);
          print(result);
          user.email = result["email"];
          user.id = result["id"].toString();
          user.country = result["country"].toString();
          user.address = result["address"].toString();
          user.firstname = result["firstname"].toString();
          user.lastname = result["lastname"].toString();
          user.username = result["username"].toString();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(child: Text('data')),
      ),
    );
  }
}
