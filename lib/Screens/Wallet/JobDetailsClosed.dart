// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/api.dart';

class JobDetailsClosed extends StatefulWidget {
  JobDetailsClosed({required this.id, super.key});
  int id;
  @override
  State<JobDetailsClosed> createState() => _JobDetailsClosedState();
}

class _JobDetailsClosedState extends State<JobDetailsClosed> {
  static String name = "";
  static String cat = "";
  static String jd = "";
  static int price = 0;
  static String deadline = "";
  static String exp = "";
  static bool type = true;
  Future<void> jdd() async {
    print(widget.id);
    var res = await http.get(Uri.parse(api + "projects/get/${widget.id}"),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    setState(() {
      print(result);
      _JobDetailsClosedState.name = result["title"];
      _JobDetailsClosedState.jd = result["fulldescription"];
      _JobDetailsClosedState.price = result["price"];
      _JobDetailsClosedState.cat = result["category"];
      _JobDetailsClosedState.type = result["fixed"];
      _JobDetailsClosedState.exp = result["experience"];
      _JobDetailsClosedState.deadline = result["timelimit"];
      print(_JobDetailsClosedState.deadline);
    });
  }

  @override
  void initState() {
    super.initState();
    jdd();
  }

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
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: kblue,
                  padding: const EdgeInsets.only(top: 20),
                  child: const Center(
                    child: Text(
                      "Job Details",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  //main container
                  child: Column(
                    children: const [
                      Pricings(),
                      Description(),
                      Deadlines(),
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
}

class Deadlines extends StatelessWidget {
  const Deadlines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text(
                  "Deadline: ${_JobDetailsClosedState.deadline} Days",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                ),
                const Spacer(),
                _JobDetailsClosedState.type
                    ? const Text(
                        "Project Type: Fixed",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    : const Text(
                        "Project Type: Hourly",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Experience: ${_JobDetailsClosedState.exp}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Details",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              _JobDetailsClosedState.jd,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class Pricings extends StatelessWidget {
  const Pricings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, //name and other details
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _JobDetailsClosedState.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  _JobDetailsClosedState.cat,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Budget",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Rs ${_JobDetailsClosedState.price}",
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Status :Completed")
              ],
            ),
          )
        ],
      ),
    );
  }
}
