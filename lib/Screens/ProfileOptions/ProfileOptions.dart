import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';

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
                        Container(
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
                        Container(
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
                        Container(
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
                        Container(
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
                        Container(
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
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Row(
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/Help1.png"))),
                              Spacer(),
                              Text(
                                "Help & Support",
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Icon(Icons.chevron_right_sharp)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: Icon(Icons.logout),
                              ),
                              Spacer(),
                              Text(
                                "Membership",
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Icon(Icons.chevron_right_sharp)
                            ],
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
