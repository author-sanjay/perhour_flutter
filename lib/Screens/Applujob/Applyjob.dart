// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, avoid_print, unnecessary_brace_in_string_interps, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Home/Home.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';

class ApplyJob extends StatefulWidget {
  ApplyJob(
      {required this.projectid,
      required this.description,
      required this.name,
      super.key});
  int projectid;
  String name;
  String description;

  @override
  State<ApplyJob> createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  static String price = "";
  static String coverletter = "";
  static String time = "";
  static String revisions = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Container(
            color: backgroundwhite,
            // padding: EdgeInsets.only(top: 20),
            // color: kblue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  color: kblue,
                  child: const Center(
                    child: Text(
                      "Submit Proposal",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "Job Details",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          widget.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(widget.description),
                      ),
                      BidInputs(
                        id: widget.projectid,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    ));
  }
}

class BidInputs extends StatefulWidget {
  BidInputs({
    required this.id,
    super.key,
  });
  int id;

  @override
  State<BidInputs> createState() => _BidInputsState();
}

class _BidInputsState extends State<BidInputs> {
  final failed = const SnackBar(
    content: Text(
      "Sorry we faced some error. Please try again after some time",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );

  final published = const SnackBar(
    content: Text(
      "Bid Placed",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    backgroundColor: Color.fromARGB(255, 87, 241, 79),
  );

  final bids = const SnackBar(
    content: Text(
      "You Dont have enough bids. Either wait for sometime or choose a membership",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Proposed Price",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Container(
                  // color: kblue,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _ApplyJobState.price = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Rs 500",
                    ),
                  ),
                )
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Cover Letter",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Container(
                  // color: kblue,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _ApplyJobState.coverletter = value;
                      });
                    },
                    // style: TextStyle(height: 300),
                    minLines: 5,
                    maxLines: 100,
                    decoration: const InputDecoration(
                      hintText: "Please assign this project to me bacause...",
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Proposed Time",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Container(
                  // color: kblue,

                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _ApplyJobState.time = val;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "20 Days",
                    ),
                  ),
                )
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Revision",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Container(
                  // color: kblue,

                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _ApplyJobState.revisions = val;
                        print(_ApplyJobState.revisions);
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "5",
                    ),
                  ),
                )
              ],
            )),
        user.bidsleft > 0
            ? Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: GestureDetector(
                  onTap: () {
                    if (user.bidsleft > 0) {
                      postbid(widget.id);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(bids);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(10)),
                    // color: kblue,
                    height: MediaQuery.of(context).size.height * 0.06,
                    // padding: EdgeInsets.only(top: 20),
                    child: const Center(
                        child: Text(
                      "Propose Bid",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    )),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(bids);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Not enough bids left"),
                      Container(
                        decoration: BoxDecoration(
                            color: kblue,
                            borderRadius: BorderRadius.circular(10)),
                        // color: kblue,
                        height: MediaQuery.of(context).size.height * 0.06,
                        // padding: EdgeInsets.only(top: 20),
                        child: const Center(
                            child: Text(
                          "Propose Bid",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        )),
                      ),
                    ],
                  ),
                ),
              )
      ],
    ));
  }

  void postbid(int projectid) async {
    final json = jsonEncode({
      "revisions": int.parse(_ApplyJobState.revisions),
      "price": int.parse(_ApplyJobState.price),
      "biddescription": _ApplyJobState.coverletter,
      "proposedtime": int.parse(_ApplyJobState.time)
    });

    try {
      var res = await http.post(
          Uri.parse("${api}bids/add/${user.id}/${projectid}"),
          headers: headers,
          body: json);
      // var result = jsonDecode(res.statusCode);
      // print(res.statusCode);
      if (jsonDecode(res.body) != null) {
        ScaffoldMessenger.of(context).showSnackBar(published);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(failed);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(failed);
      print(e);
    }
  }
}
