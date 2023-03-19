// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, override_on_non_overriding_member

import 'package:flutter/material.dart';

import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Projects/Assigned/Assigned.dart';
import 'package:perhour_flutter/Modals/Projects/Assigned/Assignedapi.dart';
import 'package:perhour_flutter/Screens/FreelancerProfile/FreelancerProfile.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';

class SelfProfile extends StatefulWidget {
  const SelfProfile({super.key});

  @override
  State<SelfProfile> createState() => _SelfProfileState();
}

class _SelfProfileState extends State<SelfProfile> {
  bool _isloading = true;
  late List<Asssigned> _getdeals;
  @override

  Future<void> getDeals() async {
    _getdeals = await Assignedapi.getall(int.parse(user.id));
    setState(() {
      _isloading = false;
    });
  }
  @override void initState() {super.initState();
  getDeals();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading?const Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                color: kblue,
                child: const Center(
                    child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                )),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: user.photo.isNotEmpty?CircleAvatar(backgroundImage: NetworkImage(user.photo),radius: MediaQuery.of(context).size.width*0.17,): const Image(
                          image: AssetImage("assets/images/Man2.png"))),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children:  [
                      Text(
                        "${user.firstname.toUpperCase() } ${user.lastname.toUpperCase()}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "@${user.username}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),


                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                            "${user.about} "),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(211, 56, 35, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const Text(
                              "Projects",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "${_getdeals.length}",
                              style:
                                  const TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(208, 4, 212, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children:  [
                            const Text(
                              "Per hour",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "${user.rate}",
                              style:
                                  const TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30, top: 20),
                child: Text("Latest Reviews"),
              ),
              Reviews(getdeals: _getdeals,)
            ],
          ),
        ),
      ),
    );
  }
}
