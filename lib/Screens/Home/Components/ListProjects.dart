// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/JobDetails/JobDetails.dart';

class ListProjects extends StatelessWidget {
  const ListProjects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 20,
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
                    builder: (context) => const JobDetails(),
                  ),
                );
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  // color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "App Development",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bids Placed: 10",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Budget",
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rs 10000",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
