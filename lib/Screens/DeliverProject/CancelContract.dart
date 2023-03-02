// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, empty_statements

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/FreelancerProfile/FreelancerProfile.dart';

class CancelContract extends StatelessWidget {
  const CancelContract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            color: backgroundwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 35, bottom: 15),
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Cancel Contract",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: const Text(
                            "Job Title",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                          child: const Text(
                            "Deadline",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FreelancerProfile(),
                            ),
                          );
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Image(
                                image: AssetImage("assets/images/Man2.png"))),
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: const Text(
                    "Job Description",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Reaseon Of Cancelling",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText:
                                    "I am cancelling this contract because"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: const Center(
                                child: Text(
                              "Cancel Contract",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                          ),
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
