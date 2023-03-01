// ignore_for_file: prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/Login/Components/BottomInputs.dart';
import 'package:perhour_flutter/Screens/Login/Components/TopLogin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [const TopLogin(), const BottomInputs()],
          ),
        ),
      ),
    );
  }
}
