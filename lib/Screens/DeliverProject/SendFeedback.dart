// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/FreelancerProfile/FreelancerProfile.dart';
import 'package:perhour_flutter/Screens/Home/Home.dart';
import 'package:perhour_flutter/api.dart';
import 'package:http/http.dart' as http;

class SendFeedBack extends StatefulWidget {
  SendFeedBack(
      {required this.id, required this.desc, required this.title, super.key});
  int id;
  String title;
  String desc;
  static double stars = 0;
  static String feedback = "";

  @override
  State<SendFeedBack> createState() => _SendFeedBackState();
}

class _SendFeedBackState extends State<SendFeedBack> {
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
                    "FeedBack",
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
                          child: Text(
                            widget.title,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: GestureDetector(
                        onTap: () {
                          //TODO
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => FreelancerProfile(),
                          //   ),
                          // );
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
                  child: Text(
                    widget.desc,
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
                            "Download Work",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("File Path"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            alignment: Alignment.topCenter,
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(SendFeedBack.stars);
                                SendFeedBack.stars = rating;
                                // setState(() {
                                //   SendFeedBack.stars = rating as int;
                                // });
                              },
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Your Feedback",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    // color: kblue,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          SendFeedBack.feedback = value;
                                        });
                                      },
                                      // style: TextStyle(height: 300),
                                      minLines: 5,
                                      maxLines: 100,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Overall I rate this freelancer as...",
                                        contentPadding: EdgeInsets.all(8),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              sendfeedback();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const Center(
                                  child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                            ),
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

  sendfeedback() async {
    final json = jsonEncode({
      "feedback": SendFeedBack.feedback,
      "feedbackstars": SendFeedBack.stars
    });
    var res = await http.post(Uri.parse(api + "projects/feedback/${widget.id}"),
        headers: headers, body: json);
    var result = jsonDecode(res.body);
    print(result);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }
}
