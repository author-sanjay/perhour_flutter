// ignore_for_file: file_names, avoid_unnecessary_containers

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 10, left: 20, right: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          update();
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.92,
                  decoration: const BoxDecoration(color: kblue),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: ProfilePhoto(),
                      ),
                      EditDetails()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void update() async {
    final json = jsonEncode({
      "phone": _EditDetailsState.phonenumber,
      "address": _EditDetailsState.address,
      "withdrawltype": _EditDetailsState.withdrawltype,
      "accountnumber": _EditDetailsState.acnumber,
      "bankingname": _EditDetailsState.bankingname,
      "id": user.id
    });

    var res = await http.post(Uri.parse(api + 'users/update'),
        headers: headers, body: json);
    var result = jsonDecode(res.body);
    print(result);
    if (res.statusCode == 200) {
      Navigator.pop(context);
    }
  }
}

class EditDetails extends StatefulWidget {
  const EditDetails({
    super.key,
  });

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  static String phonenumber = "";
  static String address = "";
  static String withdrawltype = "";
  static String acnumber = "";
  static String bankingname = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: MediaQuery.of(context).size.height * 0.64,
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0, left: 30, right: 3),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _EditDetailsState.phonenumber = value;
                        });
                      },
                      decoration:
                          const InputDecoration(hintText: "+91 787******8"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Address",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _EditDetailsState.address = value;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: "Somewhere in Heaven"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Withdrawl Type",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _EditDetailsState.withdrawltype = value;
                      },
                      decoration: const InputDecoration(hintText: "UPI/Paypal"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Withdrawl A/C",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _EditDetailsState.acnumber;
                        });
                      },
                      decoration:
                          const InputDecoration(hintText: "UPI Id/ PayPal Id"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Banking Name",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _EditDetailsState.bankingname = value;
                        });
                      },
                      decoration: const InputDecoration(hintText: "Alex"),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: MediaQuery.of(context).size.width * 0.2,
        ),
      )),
    );
  }
}
