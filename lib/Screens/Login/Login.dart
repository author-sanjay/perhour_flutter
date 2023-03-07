// ignore_for_file: prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Login/Components/BottomInputs.dart';
import 'package:perhour_flutter/Screens/Register/Components/RegisterBottom.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static bool login = true;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: kblue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.27),
                            // width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (!Login.login) {
                                        Login.login = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Login.login ? Colors.white : kblue),
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Login.login
                                              ? kblue
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (Login.login) {
                                        Login.login = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Login.login ? kblue : Colors.white),
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Login.login
                                              ? Colors.white
                                              : kblue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image(
                            image: const AssetImage("assets/images/login.png"),
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Login.login
                        ? const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              Login.login ? const BottomInputs() : const RegisterBottom()
            ],
          ),
        ),
      ),
    );
  }
}
