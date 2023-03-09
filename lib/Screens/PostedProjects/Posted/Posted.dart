// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/DeliverProject/GetDelivery.dart';
import 'package:perhour_flutter/Screens/DeliverProject/SendFeedback.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
// import 'package:perhour_flutter/Screens/PostedProjects/Posted/Feeback.dart';

class Posted extends StatefulWidget {
  const Posted({
    super.key,
  });

  @override
  State<Posted> createState() => _PostedState();
}

class _PostedState extends State<Posted> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [const SimplePlaced(), const Checkdelivery(), Feedback()],
      ),
    );
  }
}

class Feedback extends StatelessWidget {
  Feedback({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SendFeedBack(),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          color: Colors.white,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Text(
                        "App Development",
                        style: TextStyle(fontSize: 18),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kblue),
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 8, bottom: 8),
                        child: const Text(
                          "Send Feedback",
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
                        "Placed",
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GetDelivery(),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          color: Colors.white,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
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
                              builder: (context) => const GetDelivery(),
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
                            "Check Delivery",
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
                        "Placed",
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListBids(),
          ),
        );
      },
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
                    "Bids Placed:10",
                    style: TextStyle(fontSize: 15),
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
                      "Placed",
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
