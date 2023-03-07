// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';

class RegisterBottom extends StatefulWidget {
  const RegisterBottom({
    super.key,
  });
  static String email = "";
  static String password = "";
  @override
  State<RegisterBottom> createState() => _RegisterBottomState();
}

class _RegisterBottomState extends State<RegisterBottom> {
  final snackbar = SnackBar(content: Text("Email cant be null"));
  final passwordsnackbar = SnackBar(content: Text("Password cant be null"));
  final invalidemail = SnackBar(content: Text("Invalid Email"));
  final invalidepassword =
      SnackBar(content: Text("Please Create a strong password"));
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
                  RegisterBottom.email = value;
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
                  RegisterBottom.password = value;
                });
              },
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
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: GestureDetector(
              onTap: () {
                validateandnavigate();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => RegisterDetails(
                //         email: RegisterBottom.email,
                //         password: RegisterBottom.password),
                //   ),
                // );
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: kblue, borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Center(
                      child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ))),
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

  void validateandnavigate() {
    if (RegisterBottom.email.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (RegisterBottom.password.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(passwordsnackbar);
    } else if (!isemail(RegisterBottom.email)) {
      ScaffoldMessenger.of(context).showSnackBar(invalidemail);
    } else if (!validatePassword(RegisterBottom.password)) {
      ScaffoldMessenger.of(context).showSnackBar(invalidepassword);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterDetails(
              email: RegisterBottom.email, password: RegisterBottom.password),
        ),
      );
    }
  }
}
