// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Home/Components/Freelancer/Category.dart';
import 'package:perhour_flutter/Screens/Home/Components/Freelancer/Iconss.dart';
import 'package:perhour_flutter/Screens/Home/Components/Freelancer/LatestJobs.dart';
import 'package:perhour_flutter/Screens/Home/Components/Freelancer/SearchBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Container(
          color: backgroundwhite,
          child: Expanded(
            child: Iconss.work
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [SearchBar(), Category(), LatestJobs()])
                : Center(
                    child: Text("Hello"),
                  ),
          ),
        ),
      )),
    ));
  }
}
