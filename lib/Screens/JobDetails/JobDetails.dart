import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Applujob/Applyjob.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});

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
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                      child: Text(
                    "Job Details",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  //main container
                  child: Column(
                    children: [
                      Pricings(),
                      Description(),
                      Deadlines(),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ApplyJob(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            child: Center(
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
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
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
            padding: EdgeInsets.only(top: 20),
            child: Text(
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
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Details",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
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
              children: [
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
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
