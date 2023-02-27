import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Home/Components/ListProjects.dart';

class Projects extends StatefulWidget {
  Projects({required this.categoryname, super.key});
  String categoryname;
  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                color: kblue,
                child: Center(
                    child: Text(
                  widget.categoryname,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                )),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  child: Text(
                    "Latest Jobs",
                    style: TextStyle(fontSize: 16),
                  )),
              ListProjects()
            ],
          )),
        ),
      ),
    );
  }
}
