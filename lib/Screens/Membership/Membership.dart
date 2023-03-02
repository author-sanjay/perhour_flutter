import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);
  static bool monthly = false;
  static bool member = true;
  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    List coolors = [
      Color(0xFFFFC0C0),
      Color(0xFFB9F8AE),
      Color(0xFFAED0F8),
      Color(0xFFD7AEF8),
      Color(0xFFF8AEF1)
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Container(
              width: MediaQuery.of(context).size.width,
              color: backgroundwhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 68.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child:
                            Image(image: AssetImage("assets/images/vip.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Get VIP",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 18.0, left: 20, right: 20),
                    child: Text(
                      "Designed to maximise your freelancer success and earnings!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Membership.member
                      ? Padding(
                          padding: const EdgeInsets.only(top: 28.0, bottom: 10),
                          child: Container(
                            child: Text(
                              "Your Memership",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.25,
                              top: 20),
                          alignment: Alignment.topCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (!Membership.monthly) {
                                      Membership.monthly = true;
                                    }
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Membership.monthly
                                            ? kblue
                                            : backgroundwhite,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.only(
                                        right: 10, left: 10, top: 5, bottom: 5),
                                    child: Text(
                                      "Monthly",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Membership.monthly
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (Membership.monthly) {
                                      Membership.monthly = false;
                                    }
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Membership.monthly
                                            ? backgroundwhite
                                            : kblue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.only(
                                        right: 10, left: 10, top: 5, bottom: 5),
                                    child: Text(
                                      "Yearly",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Membership.monthly
                                              ? Colors.black
                                              : Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                  if (Membership.member)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: coolors[random.nextInt(5)],
                                    borderRadius: BorderRadius.circular(10)),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 38.0, left: 20, right: 20),
                                      child: Text(
                                        "Basic",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, left: 20, right: 20),
                                      child: Text(
                                        "@3999",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 20, right: 20),
                                      child: Text(
                                        "Stats",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text("Bids Left: 4/10"),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Membership.member = false;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                    color: kblue,
                                    borderRadius: BorderRadius.circular(10)),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Center(
                                    child: Text(
                                  "Extend Membership",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ))),
                          ),
                        )
                      ],
                    )
                  else
                    Membership.monthly
                        ? Monthly(coolors: coolors, random: random)
                        : Yearly(coolors: coolors, random: random)
                ],
              )),
        ),
      ),
    );
  }
}

class Yearly extends StatelessWidget {
  const Yearly({
    super.key,
    required this.coolors,
    required this.random,
  });

  final List coolors;
  final Random random;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: coolors[random.nextInt(5)],
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 38.0, left: 20, right: 20),
                            child: Text(
                              "Basic",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 20, right: 20),
                            child: Text(
                              "@3999",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20, right: 20),
                            child: Text(
                              "Benefits",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              for (int i = 0; i < 4; i++)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("data"),
                                )
                            ],
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

class Monthly extends StatelessWidget {
  const Monthly({
    super.key,
    required this.coolors,
    required this.random,
  });

  final List coolors;
  final Random random;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: coolors[random.nextInt(5)],
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 38.0, left: 20, right: 20),
                            child: Text(
                              "Basic",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 20, right: 20),
                            child: Text(
                              "@399",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20, right: 20),
                            child: Text(
                              "Benefits",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              for (int i = 0; i < 4; i++)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("data"),
                                )
                            ],
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
