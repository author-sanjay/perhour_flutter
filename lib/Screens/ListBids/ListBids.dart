import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/JobDetails/JobDetails.dart';
import 'package:perhour_flutter/Screens/ListBids/BidDetails.dart';

class ListBids extends StatelessWidget {
  const ListBids({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Topbar(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: Text(
                    "Bids",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 20),
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
                                builder: (context) => const BidsDetails(),
                              ),
                            );
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              // color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sanjay Kumar",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(
                                            "Bids Placed: 10 Bids Placed: 10Bids Placed: 10Bids Placed: 10 Bids Placed: 10",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Time: 4 Days",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Rs 10000",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Topbar extends StatelessWidget {
  const Topbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 10),
      color: kblue,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          "Bids",
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
