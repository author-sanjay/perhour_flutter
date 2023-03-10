// ignore_for_file: file_names, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, camel_case_types, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Projects/Assigned/Assigned.dart';
import 'package:perhour_flutter/Modals/Projects/Assigned/Assignedapi.dart';
import 'package:perhour_flutter/Screens/FreelancerProfile/Feebdbackshow.dart';
import 'package:perhour_flutter/Screens/Home/Home.dart';
import 'package:http/http.dart ' as http;
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';

class FreelancerProfile extends StatefulWidget {
  FreelancerProfile({required this.id,super.key});
  int id;

  @override
  State<FreelancerProfile> createState() => _FreelancerProfileState();
}

class _FreelancerProfileState extends State<FreelancerProfile> {
  bool _isloading = true;
  late List<Asssigned> _getdeals;
  @override

  Future<void> getDeals() async {
    _getdeals = await Assignedapi.getall(widget.id);
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }
  static String name="";
  static double totalstart=0;
  static String username="";
  static String photo="";
  static double rates=0;
  static String about="";
  Future<void> userr() async {
    var res = await http.get(Uri.parse(api+"users/getuser/"+widget.id.toString()),headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    setState(() {
     _FreelancerProfileState.name=result["firstname"]+" "+result["lastname"];
      _FreelancerProfileState.totalstart=result["totalstars"];
      _FreelancerProfileState.username=result["username"];
      if(result[photo]!=null){

        _FreelancerProfileState.photo=result["photo"];
      }else{
        print("Hello");
        _FreelancerProfileState.photo="";
      }
      _FreelancerProfileState.rates=result["rates"];

      _FreelancerProfileState.about=result["about"];
    });
  }


  @override void initState() {
    super.initState();
    userr();
    getDeals();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const bottomnav(),
      body: _isloading?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
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
                      child: _FreelancerProfileState.photo.length>0? Image(
                          image: NetworkImage(_FreelancerProfileState.photo)): Image(
                          image: AssetImage("assets/images/Man2.png"))),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children:  [
                      Text(
                        _FreelancerProfileState.name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "@${_FreelancerProfileState.username}",
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
                    children:  [
                      Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                            _FreelancerProfileState.about),
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
                          children:  [
                            Text(
                              "Projects",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              _getdeals.length.toString(),
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
                          children:  [
                            Text(
                              "Per hour",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "Rs ${_FreelancerProfileState.rates}",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
                      "Chat With Freelancer",
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
  Reviews({required this.getdeals,
    super.key,
  });
  List<Asssigned> getdeals;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: getdeals.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Feedbackshow(Projectname: getdeals[index].title,review: getdeals[index].feedback,givenby: getdeals[index].givenby,username: user.firstname+" "+user.lastname,stars: getdeals[index].rating),),);

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
                            children:  [
                              Text(
                                "${getdeals[index].title}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: Row(
                          children: [
                             Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: getdeals[index].rating==0?Text(
                                "5.0",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ): Text(
                                "${getdeals[index].rating}",
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
