// ignore_for_file: file_names, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';

class RegisterBottom extends StatelessWidget {
  const RegisterBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Email"),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
            child: TextFormField(
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
                print("j");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => RegisterDetails(),
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
                    "Registerr",
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
}
