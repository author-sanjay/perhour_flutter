import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';

class PostedProjects extends StatefulWidget {
  const PostedProjects({super.key});
  static bool assigned = true;
  @override
  State<PostedProjects> createState() => _PostedProjectsState();
}

class _PostedProjectsState extends State<PostedProjects> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    color: kblue,
                    padding: EdgeInsets.only(top: 45, bottom: 20),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.22),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (!PostedProjects.assigned) {
                                    PostedProjects.assigned = true;
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: PostedProjects.assigned
                                        ? Colors.white
                                        : kblue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: Text(
                                  "Assigned",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: PostedProjects.assigned
                                          ? kblue
                                          : Colors.white),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (PostedProjects.assigned) {
                                  setState(() {
                                    PostedProjects.assigned = false;
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: PostedProjects.assigned
                                        ? kblue
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "Posted",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: PostedProjects.assigned
                                          ? Colors.white
                                          : kblue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Projects"),
                        !PostedProjects.assigned
                            ? Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    SimplePlaced(),
                                    Checkdelivery(),
                                    Feedback()
                                  ],
                                ),
                              )
                            : Container(
                                child: Column(
                                  children: [AssignedProject(), Deliver()],
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

class Deliver extends StatelessWidget {
  const Deliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "App Development",
                      style: TextStyle(fontSize: 18),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kblue),
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      child: Text(
                        "Deliver",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ))
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Assigned",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "\$5000",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AssignedProject extends StatelessWidget {
  const AssignedProject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "App Development",
                      style: TextStyle(fontSize: 18),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "DeadLine: 23/10/2001",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Assigned",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "\$5000",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Feedback extends StatelessWidget {
  const Feedback({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        color: Colors.white,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "App Development",
                      style: TextStyle(fontSize: 18),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kblue),
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      child: Text(
                        "Send Feedback",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ))
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Placed",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "\$5000",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Checkdelivery extends StatelessWidget {
  const Checkdelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        color: Colors.white,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "App Development",
                      style: TextStyle(fontSize: 18),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kblue),
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      child: Text(
                        "Check Delivery",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ))
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Placed",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "\$5000",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimplePlaced extends StatelessWidget {
  const SimplePlaced({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "App Development",
                    style: TextStyle(fontSize: 18),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Bids Placed:10",
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    "Placed",
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  "\$5000",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
