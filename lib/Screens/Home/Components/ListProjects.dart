// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Modals/Jobs/JobsModel.dart';
import 'package:perhour_flutter/Screens/JobDetails/JobDetails.dart';

class ListProjects extends StatefulWidget {
  ListProjects({
    required this.getjobs,
    super.key,
  });
  List<Jobs> getjobs;

  @override
  State<ListProjects> createState() => _ListProjectsState();
}

class _ListProjectsState extends State<ListProjects> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.getjobs.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(48.0),
              child: Center(
                child: Text(
                    "We dont have projects in this category. Please try after some time"),
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: widget.getjobs.length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobDetails(
                              id: widget.getjobs[index].id,
                              budget: widget.getjobs[index].price,
                              description: widget.getjobs[index].fulldesc,
                              name: widget.getjobs[index].title,
                              time: widget.getjobs[index].time,
                              type: widget.getjobs[index].fixed
                                  ? "Fixed"
                                  : "Hourly",
                              category: widget.getjobs[index].category,
                              exp: widget.getjobs[index].experience),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      // color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.getjobs[index].title,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Bids Placed:${widget.getjobs[index].bids}",
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Budget",
                                  style: TextStyle(fontSize: 10),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Rs ${widget.getjobs[index].price.toString()}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.green),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
