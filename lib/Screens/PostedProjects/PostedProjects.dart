// ignore_for_file: file_names, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/DeliverProject/DeliverProject.dart';
import 'package:perhour_flutter/Screens/PostedProjects/Posted/Posted.dart';

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
                    padding: const EdgeInsets.only(top: 45, bottom: 20),
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                        const Text("Projects"),
                        !PostedProjects.assigned ? Posted() : Assigned()
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

class Assigned extends StatelessWidget {
  const Assigned({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [Deliver()],
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
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Text(
                      "App Development",
                      style: TextStyle(fontSize: 18),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DeliverProject(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kblue),
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 8, bottom: 8),
                        child: const Text(
                          "Deliver",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: const Text(
                      "Assigned",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: const Text(
                      "\$5000",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: const Text(
                      "Deadline: 23-10-2001",
                      style: TextStyle(fontSize: 12),
                    ))
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
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Text(
                      "App Development",
                      style: TextStyle(fontSize: 18),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "DeadLine: 23/10/2001",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: const Text(
                      "Assigned",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 18.0),
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
