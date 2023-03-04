import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';

class RegisterDetails extends StatelessWidget {
  const RegisterDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text("Just Need Few More Details"),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("First Name"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: "First Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Last Name"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: "Last Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Date Of Birth"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: "DD/MM/YYYY"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Address"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: "Address"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Country"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: "Country"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                    decoration:
                                        InputDecoration(hintText: "Username"),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: kblue,
                                      borderRadius: BorderRadius.circular(10)),
                                  // width: MediaQuery.of(context).size.width * 0.3,
                                  child: Text(
                                    "Available?",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
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
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kblue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Start Earnig",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ))),
        ),
      ),
    );
  }

  // First name
  // Last Name
  //dob
  //address
  //country
  //username
}
