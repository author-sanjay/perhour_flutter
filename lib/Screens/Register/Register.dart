// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/Register/Components/RegisterBottom.dart';
import 'package:perhour_flutter/Screens/Register/Components/RegisterTop.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [RegisterTop(), RegisterBottom()],
          ),
        ),
      ),
    );
  }
}
