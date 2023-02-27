// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Home/Components/Freelancer/Category.dart';
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
        child: Container(
          color: backgroundwhite,
          child: Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SearchBar(),
              Category(),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                  child: Container(
                    child: Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Latest Jobs",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: 20,
                              separatorBuilder: (_, __) => const Divider(),
                              itemBuilder: (context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 20),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      padding: EdgeInsets.all(20),
                                      // color: Colors.white,
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("App Development"),
                                              Text("Bids Placed: 10")
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Budget"),
                                              Text("Rs 1000")
                                            ],
                                          )
                                        ],
                                      )),
                                );
                              },
                            ),
                          ]),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    ));
  }
}
