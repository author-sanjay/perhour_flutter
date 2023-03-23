// ignore_for_file: file_names, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/Home/Home.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomInputs extends StatefulWidget {
  const BottomInputs({
    super.key,
  });

  @override
  State<BottomInputs> createState() => _BottomInputsState();
}

class _BottomInputsState extends State<BottomInputs> {
  static String email = "";
  static String password = "";
  final snackbar = const SnackBar(
    content: Text(
      "Email cant be null",
    ),
  );
  final wrongdetails = const SnackBar(
    content: Text(
      "Invalid Email Or Password",
    ),
  );
  final passwordsnackbar = const SnackBar(
    content: Text(
      "Password cant be null",
    ),
  );
  final invalidemail = const SnackBar(
    content: Text(
      "Invalid Email",
    ),
  );
  final invalidepassword = const SnackBar(
    content: Text(
      "Please Create a strong password",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _BottomInputsState.email = value;
                });
              },
              decoration: const InputDecoration(hintText: "Email"),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _BottomInputsState.password = value;
                });
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(hintText: "Password"),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, left: 50, right: 50),
            child: const Flexible(
              child: Text(
                "By signing in you agree with our T&Cs and privacy policies",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: GestureDetector(
              onTap: () {
                validateandnavigate();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Home(),
                //   ),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                child: const Center(
                  child: Text(
                    "Login in",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isemail(String val) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);
  }

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  //A function that validate user entered password
  bool validatePassword(String pass) {
    String password = pass.trim();
    if (pass_valid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  void validateandnavigate() async {
    if (_BottomInputsState.email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (_BottomInputsState.password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordsnackbar);
    } else if (!isemail(_BottomInputsState.email)) {
      ScaffoldMessenger.of(context).showSnackBar(invalidemail);
    } else if (!validatePassword(_BottomInputsState.password)) {
      ScaffoldMessenger.of(context).showSnackBar(invalidepassword);
    } else {
      var res = await http.post(
          Uri.parse(
              "${api}users/login/${_BottomInputsState.email}/${_BottomInputsState.password}"),
          headers: headers);

      if (res.body.isNotEmpty) {
        var result = jsonDecode(res.body);
        print(result);
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("uid", result["id"].toString());
        sharedPreferences.setString(
            "name", result["firstname"] + result["lastname"]);
        sharedPreferences.setString("email", result["email"]);
        user.email = result["email"];
        user.id = result["id"].toString();
        user.country = result["country"].toString();
        user.address = result["address"].toString();
        user.firstname = result["firstname"].toString();
        user.referralcode=result["referralcode"].toString();
        user.lastname = result["lastname"].toString();
        user.username = result["username"].toString();
        user.membershipid = result["membershipid"];
        user.about = result["about"];
        user.rate = result["rates"];
        user.stars = result["star"];
        user.role = result["role"];
        if (result["photo"] != null) {
          user.photo = result["photo"];
        }

        user.bidsleft = result["bidsleft"];
        // user.membershipexpiry=result["membershipexpiry"].toString();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(wrongdetails);
      }
    }
  }
}
