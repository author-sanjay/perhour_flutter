// ignore_for_file: file_names, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Projects/Assigned/Assignedapi.dart';
import 'package:perhour_flutter/Screens/DeliverProject/DeliverProject.dart';
import 'package:perhour_flutter/Modals/Projects/Assigned/Assigned.dart';
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

class Assigned extends StatefulWidget {
  const Assigned({
    super.key,
  });

  @override
  State<Assigned> createState() => _AssignedState();
}

class _AssignedState extends State<Assigned> {
  bool _isloading = true;
  late List<Asssigned> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Assignedapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                for (int i = 0; i < _getdeals.length; i++)
                  Deliver(
                    deadline: "23-10-2001",
                    id: _getdeals[i].id,
                    price: _getdeals[i].price,
                    status: _getdeals[i].status,
                    title: _getdeals[i].title,
                  )
              ],
            ),
    );
  }
}

class Deliver extends StatefulWidget {
  Deliver({
    required this.deadline,
    required this.id,
    required this.price,
    required this.status,
    required this.title,
    super.key,
  });
  String title;
  String status;
  int id;
  int price;
  String deadline;

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
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
                    child: Text(
                      widget.title,
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
                    child: Text(
                      widget.status,
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Rs ${widget.price}",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Deadline: ${widget.deadline}",
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
