// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class JobDetailsClosed extends StatelessWidget {
  const JobDetailsClosed({super.key});

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
              children: const [
                Text(
                  "Deadline: 4 Days",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                Spacer(),
                Text("Project Type: One Time",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              "Experience: Intermediate",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
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
            child: const Text(
              "BudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudgetBudget",
              style: TextStyle(fontSize: 12),
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
              children: const [
                Text(
                  "App Development",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Category",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "Budget",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Rs 5000",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Status :Completed")
              ],
            ),
          )
        ],
      ),
    );
  }
}
