import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';

class BidsDetails extends StatelessWidget {
  const BidsDetails({super.key});

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
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Bid Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child:
                            Image(image: AssetImage("assets/images/Man2.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Freelancer Name",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 20, top: 20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Time: 5 Days",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              "\$ 5000",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.green),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                              "jhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhjjhjhj"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                                right: MediaQuery.of(context).size.width * 0.1,
                                top: 8,
                                bottom: 8),
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(10)),
                            // width: MediaQuery.of(context).size.width * 0.8,

                            child: Text(
                              "Chat With Freelancer",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.175,
                                right:
                                    MediaQuery.of(context).size.width * 0.175,
                                top: 8,
                                bottom: 8),
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(10)),
                            // width: MediaQuery.of(context).size.width * 0.8,

                            child: Text(
                              "Assign Project",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
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
