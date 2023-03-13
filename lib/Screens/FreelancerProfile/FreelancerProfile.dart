// ignore_for_file: file_names, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Home/Home.dart';

class FreelancerProfile extends StatefulWidget {
  FreelancerProfile({required this.id,super.key});
  int id;

  @override
  State<FreelancerProfile> createState() => _FreelancerProfileState();
}

class _FreelancerProfileState extends State<FreelancerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const bottomnav(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: const Image(
                          image: AssetImage("assets/images/Man2.png"))),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: const [
                      Text(
                        "Sanjay Kumar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "@sanju",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      )
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
                    children: const [
                      Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                            "About me About me About me About me About me About me "),
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
                          children: const [
                            Text(
                              "Projects",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "24",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                          children: const [
                            Text(
                              "Per hour",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "24",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
              const Reviews()
            ],
          ),
        ),
      ),
    );
  }
}

class bottomnav extends StatefulWidget {
  const bottomnav({
    super.key,
  });

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  bool swipe = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          swipe = true;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          swipe = true;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width,
        color: kblue,
        padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: MediaQuery.of(context).size.width * 0.24),
        child: Center(
          child: swipe
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hire Sanjay Kumar",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_right_sharp,
                      color: Colors.white,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 20),
            child: GestureDetector(
              onTap: () {

              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(10),
                  // color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: 60,
                          height: 60,
                          child: const Image(
                            image: AssetImage("assets/images/ui.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "App Development",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                            ),
                            Container(
                              width: 20,
                              child: const Image(
                                  image: AssetImage("assets/images/Star1.png")),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
