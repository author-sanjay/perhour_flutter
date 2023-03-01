// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class TopLogin extends StatelessWidget {
  const TopLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kblue,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60),
            child: Image(
              image: const AssetImage("assets/images/login.png"),
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
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
