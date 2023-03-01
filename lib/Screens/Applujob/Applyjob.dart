// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Home/Home.dart';

class ApplyJob extends StatelessWidget {
  const ApplyJob({super.key});

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
                        child: const Text(
                          "Job Title",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "hghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgjhghgj"),
                      ),
                      const BidInputs()
                    ],
                  ),
                )
              ],
            ),
          )),
    ));
  }
}

class BidInputs extends StatelessWidget {
  const BidInputs({
    super.key,
  });

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
                  child: const TextField(
                    // style: TextStyle(height: 300),
                    minLines: 5,
                    maxLines: 100,
                    decoration: InputDecoration(
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
                    decoration: const InputDecoration(
                      hintText: "5",
                    ),
                  ),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
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
      ],
    ));
  }
}
