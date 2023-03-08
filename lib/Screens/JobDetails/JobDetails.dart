// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Applujob/Applyjob.dart';

class JobDetails extends StatefulWidget {
  JobDetails(
      {required this.id,
      required this.budget,
      required this.description,
      required this.name,
      required this.time,
      required this.type,
      required this.category,
      required this.exp,
      super.key});
  int id;
  String name;
  int budget;
  String description;
  String time;
  String type;
  String category;
  String exp;

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
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
                        fontWeight: FontWeight.w300),
                  )),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  //main container
                  child: Column(
                    children: [
                      Pricings(
                          title: widget.name,
                          category: widget.category,
                          price: widget.budget),
                      Description(getDescription: widget.description),
                      Deadlines(
                          exp: widget.exp,
                          time: widget.time,
                          type: widget.type),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ApplyJob(
                                    projectid: widget.id,
                                    description: widget.description,
                                    name: widget.name),
                              ),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: kblue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10),
                            child: const Center(
                                child: Text(
                              "Apply",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            )),
                          ),
                        ),
                      )
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

class Deadlines extends StatefulWidget {
  Deadlines({
    required this.exp,
    required this.time,
    required this.type,
    super.key,
  });
  String time;
  String type;
  String exp;

  @override
  State<Deadlines> createState() => _DeadlinesState();
}

class _DeadlinesState extends State<Deadlines> {
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
                  "Deadline: ${widget.time} Days",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                ),
                const Spacer(),
                Text("Project Type: ${widget.type}",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Experience: ${widget.exp}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatefulWidget {
  Description({
    required this.getDescription,
    super.key,
  });
  String getDescription;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              widget.getDescription,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class Pricings extends StatefulWidget {
  Pricings({
    required this.title,
    required this.category,
    required this.price,
    super.key,
  });
  String title;
  String category;
  int price;

  @override
  State<Pricings> createState() => _PricingsState();
}

class _PricingsState extends State<Pricings> {
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
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  widget.category,
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
                  "Rs ${widget.price}",
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
