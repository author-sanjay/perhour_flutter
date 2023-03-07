// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';
import 'package:http/http.dart' as http;

class PostJob extends StatefulWidget {
  const PostJob({super.key});

  static bool hourly = true;
  @override
  State<PostJob> createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {
  static String title = "";
  static String budget = "";
  static String timelimit = "";
  static bool hourly = true;
  static String fulldescription = "";
  static int experience = 0;
  static String category = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Container(
            color: backgroundwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Topbar(
                  title: "Post Job",
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Text(
                    "Job Details",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _PostJobState.title = value;
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: "App Development"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Budget",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _PostJobState.budget = value;
                            });
                          },
                          decoration:
                              const InputDecoration(hintText: "Rs 5000"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deadline",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _PostJobState.timelimit = value;
                            });
                          },
                          decoration:
                              const InputDecoration(hintText: "30 Days"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Type",
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (!PostJob.hourly) {
                                        PostJob.hourly = true;
                                        _PostJobState.hourly = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: PostJob.hourly
                                            ? kblue
                                            : backgroundwhite,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Hourly",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: PostJob.hourly
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (PostJob.hourly) {
                                        PostJob.hourly = false;
                                        _PostJobState.hourly = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: PostJob.hourly
                                              ? backgroundwhite
                                              : kblue),
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        "Fixed",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: PostJob.hourly
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Experience",
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_PostJobState.experience != 0) {
                                        _PostJobState.experience = 0;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: _PostJobState.experience == 0
                                            ? kblue
                                            : backgroundwhite,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Beginner",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: _PostJobState.experience == 0
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_PostJobState.experience != 1) {
                                        _PostJobState.experience = 1;
                                      }
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: _PostJobState.experience == 1
                                              ? kblue
                                              : backgroundwhite),
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        "Intermediate",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: _PostJobState.experience == 1
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      )),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_PostJobState.experience != 2) {
                                        _PostJobState.experience = 2;
                                      }
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: _PostJobState.experience == 2
                                              ? kblue
                                              : backgroundwhite),
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        "Expert",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: _PostJobState.experience == 2
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Category",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _PostJobState.category = value;
                            });
                          },
                          decoration: const InputDecoration(
                              hintText:
                                  "Software / Editing / Writing / Others"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            // color: kblue,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextField(
                              // style: TextStyle(height: 300),
                              onChanged: (value) {
                                setState(() {
                                  _PostJobState.fulldescription = value;
                                });
                              },
                              minLines: 5,
                              maxLines: 100,
                              decoration: const InputDecoration(
                                hintText: "I want an app to be built...",
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 20, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      postjob();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: kblue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Post",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
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

  void postjob() async {
    var verify = verifycategory();
    if (!verify) {
      setState(() {
        _PostJobState.category = "Others";
      });
    }
    String exp = "";
    if (_PostJobState.experience == 0) {
      exp = "Beginner";
    } else if (_PostJobState.experience == 1) {
      exp = "Intermediate";
    } else if (_PostJobState.experience == 2) {
      exp = "Expert";
    }
    final json = jsonEncode({
      "title": _PostJobState.title,
      "fulldescription": _PostJobState.fulldescription,
      "price": int.parse(_PostJobState.budget),
      "timelimit": int.parse(_PostJobState.timelimit),
      "fixed": !_PostJobState.hourly,
      "category": _PostJobState.category,
      "experience": exp
    });

    var res = await http.post(Uri.parse(api + 'projects/add/' + user.id),
        headers: headers, body: json);
    var result = jsonDecode(res.body);
    print(result);
    if (res.statusCode == 200) {
      Navigator.pop(context);
    }
  }
}

bool verifycategory() {
  if (_PostJobState.category.toUpperCase() == "SOFTWARE" ||
      _PostJobState.category.toUpperCase() == "EDITING" ||
      _PostJobState.category.toUpperCase() == "WRITING") {
    return true;
  } else {
    return false;
  }
}
