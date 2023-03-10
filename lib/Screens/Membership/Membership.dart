// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Membership/Membership.dart';
import 'package:perhour_flutter/Modals/Membership/Membershipapi.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';
import 'package:http/http.dart' as http;

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);
  static bool monthly = false;
  static bool member = true;
  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  bool _isloading = true;
  late List<Member> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Memberapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
    splitdata(_getdeals);
  }

  static List<Member> _monthly = [];
  static List<Member> _yearly = [];
  splitdata(List<Member> _getdeals) {
    for (int i = 0; i < _getdeals.length; i++) {
      if (_getdeals[i].monthly) {
        setState(() {
          _MembershipState._monthly.add(_getdeals[i]);
        });
      } else {
        setState(() {
          _MembershipState._yearly.add(_getdeals[i]);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    List coolors = [
      const Color(0xFFFFC0C0),
      const Color(0xFFB9F8AE),
      const Color(0xFFAED0F8),
      const Color(0xFFD7AEF8),
      const Color(0xFFF8AEF1)
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
                        child: const Image(
                            image: AssetImage("assets/images/vip.png"))),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Get VIP",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18.0, left: 20, right: 20),
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
                            child: const Text(
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
                                    padding: const EdgeInsets.only(
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
                                    padding: const EdgeInsets.only(
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
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 38.0, left: 20, right: 20),
                                      child: Text(
                                        "Basic",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0, left: 20, right: 20),
                                      child: Text(
                                        "@3999",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
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
                                          const Padding(
                                            padding: EdgeInsets.only(top: 8.0),
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
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                    color: kblue,
                                    borderRadius: BorderRadius.circular(10)),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: const Center(
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
                        ? Monthly(
                            coolors: coolors,
                            random: random,
                            monthly: _getdeals)
                        : Yearly(
                            coolors: coolors,
                            random: random,
                            yearly: _getdeals,
                          )
                ],
              )),
        ),
      ),
    );
  }
}

class Yearly extends StatelessWidget {
  Yearly({
    required this.yearly,
    super.key,
    required this.coolors,
    required this.random,
  });
  List<Member> yearly;
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
                for (int i = 0; i < yearly.length; i++)
                  yearly[i].monthly
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              addmembership(yearly[i].id);
                            },
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
                                    padding: EdgeInsets.only(
                                        top: 38.0, left: 20, right: 20),
                                    child: Text(
                                      yearly[i].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.0, left: 20, right: 20),
                                    child: Text(
                                      "@${yearly[i].price}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, left: 20, right: 20),
                                    child: Text(
                                      "Benefits",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Benifits(
                                    benifits: yearly[i].benefits,
                                  )
                                ],
                              ),
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

  addmembership(int membershipid) async {
    var res = await http.post(
        Uri.parse("${api}users/addmembership/${user.id}/${membershipid}"),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    
  }
}

class Benifits extends StatelessWidget {
  const Benifits({
    super.key,
    required this.benifits,
  });

  final String benifits;

  @override
  Widget build(BuildContext context) {
    var l = benifits.split("\r");
    print(l);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < l.length; i++)
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 10, right: 10),
            child: Text(
              l[i],
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }
}

class Monthly extends StatelessWidget {
  Monthly({
    required this.monthly,
    super.key,
    required this.coolors,
    required this.random,
  });
  List<Member> monthly;

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
                for (int i = 0; i < monthly.length; i++)
                  monthly[i].monthly
                      ? Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              addmembership(monthly[i].id);
                            },
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
                                    padding: EdgeInsets.only(
                                        top: 38.0, left: 20, right: 20),
                                    child: Text(
                                      monthly[i].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.0, left: 20, right: 20),
                                    child: Text(
                                      "@${monthly[i].price}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, left: 20, right: 20),
                                    child: Text(
                                      "Benefits",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Benifits(benifits: monthly[i].benefits)
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  addmembership(int membershipid) async {
    var res = await http.post(
        Uri.parse("${api}users/addmembership/${user.id}/${membershipid}"),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
  }
}
