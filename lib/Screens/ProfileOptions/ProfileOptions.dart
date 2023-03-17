// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/EditProfile/EditProfile.dart';
import 'package:perhour_flutter/Screens/Help&Support/HelpAndSupport.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/Screens/Login/Login.dart';
import 'package:perhour_flutter/Screens/ManageSupport/ManageSupport.dart';
import 'package:perhour_flutter/Screens/Membership/Membership.dart';
import 'package:perhour_flutter/Screens/PostJob/PostJob.dart';
import 'package:perhour_flutter/Screens/PostedProjects/PostedProjects.dart';
import 'package:perhour_flutter/Screens/Wallet/Wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: kblue,
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              color: backgroundwhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Image(
                      image: AssetImage("assets/images/Man2.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Sanjay Kumar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      for (int i = 0; i < 4; i++)
                        Container(
                          width: 20,
                          child: Image(
                            image: AssetImage("assets/images/Star1.png"),
                          ),
                        ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Edit1.png"))),
                                Spacer(),
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right_sharp)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Membership(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Membershipcard1.png"))),
                                Spacer(),
                                Text(
                                  "Membership",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right_sharp)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostedProjects(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Briefing1.png"))),
                                Spacer(),
                                Text(
                                  "Projects",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right_sharp)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostJob(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Bill1.png"))),
                                Spacer(),
                                Text(
                                  "Post Job",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right_sharp)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Wallet(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Wallet1.png"))),
                                Spacer(),
                                Text(
                                  "Payments",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right_sharp)
                              ],
                            ),
                          ),
                        ),

                        user.role=="ROLE_ADMIN"?GestureDetector(
                          onTap: ()  {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ManageSupport(),),);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  child: Icon(Icons.chat_bubble),
                                ),
                                Spacer(),
                                Text(
                                  "Manage Support",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right_sharp)
                              ],
                            ),
                          ),
                        ):Container(),
                        GestureDetector(
                          onTap: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.remove('email');
                            prefs.remove('uid');
                            prefs.remove('name');
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Login(),),);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  child: Icon(Icons.logout),
                                ),
                                Spacer(),
                                Text(
                                  "Log Out",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right_sharp)
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }


}
