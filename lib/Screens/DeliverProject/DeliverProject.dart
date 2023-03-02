// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class DeliverProject extends StatelessWidget {
  const DeliverProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            color: backgroundwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 35, bottom: 15),
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Deliver Project",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Job Title",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Text(
                    "Deadline",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Job Description",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Upload Work",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("File Path"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Center(
                                child: Text(
                              "Submit",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
