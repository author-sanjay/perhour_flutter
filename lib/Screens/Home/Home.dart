// ignore_for_file: file_names, unnecessary_new, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/ChatScreen/ChatList.dart';
import 'package:perhour_flutter/Screens/Home/Client/FreelancersList.dart';
import 'package:perhour_flutter/Screens/Home/Client/SearchFreelancer.dart';
import 'package:perhour_flutter/Screens/Home/Client/SwipeCard.dart';
import 'package:perhour_flutter/Screens/Home/Components/Freelancer/Category.dart';
import 'package:perhour_flutter/Screens/Home/Components/Freelancer/LatestJobs.dart';
import 'package:perhour_flutter/Screens/Home/Components/Searchlist.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/Screens/ProfileOptions/ProfileOptions.dart';
import 'package:perhour_flutter/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static bool work = true;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List colorss = [
    const Color.fromRGBO(137, 65, 237, 1),
    const Color.fromRGBO(211, 56, 35, 1),
    const Color.fromRGBO(208, 4, 212, 1),
  ];

  static String searchquery="";

  @override
  void initState() {
    super.initState();
    print(user.firstname);
    print(user.role);
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Container(
              color: backgroundwhite,
              child: Expanded(
                child: Home.work
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: kblue,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Drawer(),
                                              ),
                                            );
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileOptions(),
                                                ),
                                              );
                                            },
                                            child: const Icon(
                                              Icons.menu,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            if (!Home.work) {
                                              setState(() {
                                                Home.work = true;
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Home.work
                                                  ? Colors.white
                                                  : kblue,
                                            ),
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 5,
                                                bottom: 5),
                                            child: Text(
                                              "Work",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Home.work
                                                    ? kblue
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (Home.work) {
                                              setState(() {
                                                Home.work = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Home.work
                                                  ? kblue
                                                  : Colors.white,
                                            ),
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 5,
                                                bottom: 5),
                                            child: Text(
                                              "Hire",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Home.work
                                                    ? Colors.white
                                                    : kblue,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatList(),
                                              ),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.wechat_sharp,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(bottom: 10),
                                    color: kblue,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 30.0, top: 20),
                                          child: Text(
                                            "Good Morning, ${user.firstname.toUpperCase()}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 18.0),
                                          child: Center(
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 30, right: 30),
                                              // padding: EdgeInsets.only(bottom: 20),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    10,
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child:
                                                    TextFormField(
                                                      onChanged: (v){
                                                        setState(() {
                                                          _HomeState.searchquery=v;
                                                          print(_HomeState.searchquery);
                                                        });
                                                      },
                                                      onFieldSubmitted: (v){
                                                        if(_HomeState.searchquery.length>0){
                                                        Navigator.push(context,MaterialPageRoute(builder: (context) => Searchlist(search: _HomeState.searchquery),),);}
                                                      },

                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  "Search Projects"),
                                                    ),
                                                    // Icon(Icons.search)

                                                ),
                                              ),
                                            ),
                                          ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Category(),
                            const LatestJobs()
                          ])
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(
                                  20,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: kblue,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileOptions(),
                                            ),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.menu,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          if (!Home.work) {
                                            setState(() {
                                              Home.work = true;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Home.work
                                                ? Colors.white
                                                : kblue,
                                          ),
                                          padding: const EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 5,
                                              bottom: 5),
                                          child: Text(
                                            "Work",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Home.work
                                                  ? kblue
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (Home.work) {
                                            setState(() {
                                              Home.work = false;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Home.work
                                                ? kblue
                                                : Colors.white,
                                          ),
                                          padding: const EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 5,
                                              bottom: 5),
                                          child: Text(
                                            "Hire",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Home.work
                                                  ? Colors.white
                                                  : kblue,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ChatList(),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.wechat_sharp,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(bottom: 10),
                                  color: kblue,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 30.0, top: 20),
                                        child: Text(
                                          "Good Morning, Sanjay",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 18.0),
                                        child: Center(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 30, right: 30),
                                            // padding: EdgeInsets.only(bottom: 20),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  10,
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: TextFormField(
                                                onChanged: (v){
                                                  setState(() {
                                                    _HomeState.searchquery=v;
                                                  });
                                                },
                                                onFieldSubmitted: (v){
                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => SearchFreelancer(st: _HomeState.searchquery),),);
                                                },
                                                decoration: const InputDecoration(
                                                    hintText:
                                                        "Search Project "),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SwipeCards(colorss: colorss, random: random),
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 18.0, left: 20, bottom: 20),
                            child: Text(
                              "Our Recommendation",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const FreelancersList(),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
