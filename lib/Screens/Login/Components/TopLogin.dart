// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class TopLogin extends StatefulWidget {
  const TopLogin({
    super.key,
  });

  @override
  State<TopLogin> createState() => _TopLoginState();
}

class _TopLoginState extends State<TopLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kblue,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            50,
          ),
        ),
      ),
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
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        color: Colors.white,
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 15, color: Colors.white),
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
          const Text(
            "Login",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
