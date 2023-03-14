// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, avoid_print, unused_local_variable, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/Login/Login.dart';
import 'package:perhour_flutter/User.dart';
import 'package:perhour_flutter/api.dart';

Users user = Users();

class RegisterDetails extends StatefulWidget {
  RegisterDetails({required this.email, required this.password, super.key});
  String email;
  String password;
  static bool available = false;
  @override
  State<RegisterDetails> createState() => _RegisterDetailsState();
}

class _RegisterDetailsState extends State<RegisterDetails> {
  static String firstname = "";
  static String lastname = "";
  static String dob = "";
  static String address = "";
  static String country = "";
  static String about="";
  static String username = "";
  static double rate=0;
  @override
  void initState() {
    super.initState();
    print(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    const snakbar = SnackBar(content: Text("Username Not available"));

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Container(
              color: backgroundwhite,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:58.0),
                    child: const Text("Just Need Few More Details"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("First Name"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _RegisterDetailsState.firstname = value;
                              });
                            },
                            decoration:
                                const InputDecoration(hintText: "First Name"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Last Name"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _RegisterDetailsState.lastname = value;
                              });
                            },
                            decoration:
                                const InputDecoration(hintText: "Last Name"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Date Of Birth"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _RegisterDetailsState.dob = value;
                              });
                            },
                            decoration:
                                const InputDecoration(hintText: "DD/MM/YYYY"),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("About You"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _RegisterDetailsState.about = value;
                              });
                            },
                            // style: TextStyle(height: 300),
                            minLines: 5,
                            maxLines: 100,
                            decoration: const InputDecoration(
                              hintText:
                              "I am a ...",
                              contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Address"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _RegisterDetailsState.address = value;
                              });
                            },
                            decoration:
                                const InputDecoration(hintText: "Address"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Your Hourly Rates"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _RegisterDetailsState.rate = double.parse(value) ;
                              });
                            },
                            decoration:
                            const InputDecoration(hintText: "Rs 1000/hour"),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Country"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _RegisterDetailsState.country = value;
                              });
                            },
                            decoration:
                                const InputDecoration(hintText: "Country"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Username"),
                        ),
                        Container(
                          child: Center(
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        _RegisterDetailsState.username = value;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "Username"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    verifyusername();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: kblue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    // width: MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      "Available?",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (RegisterDetails.available) {
                          postuser();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: kblue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Start Earnig",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ))),
        ),
      ),
    );
  }

  verifyusername() async {
    print(_RegisterDetailsState.username);

    var res = await http.post(
        Uri.parse(
            '${api}users/verifyusername/${_RegisterDetailsState.username}'),
        headers: headers);

    // var result = res.body;
    // print(result);
    if(res.body=="true"){
      print("helo");
      setState(() {
        RegisterDetails.available=true;
      });
    }else{
      print(res.body);
    }
  }

  Future postuser() async {
    final json = jsonEncode({
      "firstname": _RegisterDetailsState.firstname,
      "lastname": _RegisterDetailsState.lastname,
      "dateofbirth": _RegisterDetailsState.dob,
      "address": _RegisterDetailsState.address,
      "country": _RegisterDetailsState.country,
      "email": widget.email,
      "username": _RegisterDetailsState.username,
      "password": widget.password,
      "rates":_RegisterDetailsState.rate,
      "about":_RegisterDetailsState.about
    });
    var res = await http.post(Uri.parse('${api}users/add'),
        headers: headers, body: json);
    var result = res.body;
    if (res.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }
}
