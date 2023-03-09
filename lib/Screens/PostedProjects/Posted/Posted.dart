// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Projects/Posted/Posted.dart';
import 'package:perhour_flutter/Modals/Projects/Posted/Postedapi.dart';
import 'package:perhour_flutter/Screens/DeliverProject/GetDelivery.dart';
import 'package:perhour_flutter/Screens/DeliverProject/SendFeedback.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
// import 'package:perhour_flutter/Screens/PostedProjects/Posted/Feeback.dart';

class Posted extends StatefulWidget {
  Posted({
    super.key,
  });

  @override
  State<Posted> createState() => _PostedState();
}

class _PostedState extends State<Posted> {
  bool _isloading = true;
  late List<Postedd> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Postedapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? Center(
            child: CircularProgressIndicator(
              color: kblue,
            ),
          )
        : Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Assigned(
                  deliverydate: "23/10/2001",
                  price: 5000,
                  status: "assigned",
                  title: "App Development",
                ),

                for (int i = 0; i < _getdeals.length; i++)
                  if (_getdeals[i].status == "Placed")
                    SimplePlaced(
                      bidsplace: _getdeals[i].bids,
                      price: _getdeals[i].price,
                      status: _getdeals[i].status,
                      title: _getdeals[i].title,
                    )
                  else if (_getdeals[i].status == "Delivered")
                    Checkdelivery(
                      bidsplace: _getdeals[i].bids,
                      price: _getdeals[i].price,
                      status: _getdeals[i].status,
                      title: _getdeals[i].title,
                    )
                  else if (_getdeals[i].status == "Completed")
                    Feedback(
                      bidsplace: _getdeals[i].bids,
                      price: _getdeals[i].price,
                      status: _getdeals[i].status,
                      title: _getdeals[i].title,
                    )
                // Checkdelivery(),
                // Feedback()
              ],
            ),
          );
  }
}

class Assigned extends StatefulWidget {
  Assigned({
    required this.deliverydate,
    required this.price,
    required this.status,
    required this.title,
    super.key,
  });
  String title;
  String deliverydate;
  String status;
  int price;

  @override
  State<Assigned> createState() => _AssignedState();
}

class _AssignedState extends State<Assigned> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "titlew",
                        style: TextStyle(fontSize: 18),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Delivery Date",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(
                          "Date",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
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
                    padding: EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Rs ",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kblue,
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center(
                child: Text(
              "Chat With Freelancer",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}

class Feedback extends StatefulWidget {
  Feedback({
    required this.bidsplace,
    required this.price,
    required this.status,
    required this.title,
    super.key,
  });

  String title;
  int bidsplace;
  String status;
  int price;

  @override
  State<Feedback> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
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
          margin: EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "${widget.title}",
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
                      child: Text(
                        "${widget.status}",
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Rs ${widget.price}",
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

class Checkdelivery extends StatefulWidget {
  Checkdelivery({
    required this.bidsplace,
    required this.price,
    required this.status,
    required this.title,
    super.key,
  });
  String title;
  int bidsplace;
  String status;
  int price;

  @override
  State<Checkdelivery> createState() => _CheckdeliveryState();
}

class _CheckdeliveryState extends State<Checkdelivery> {
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
          margin: EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "${widget.title}",
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
                      child: Text(
                        "${widget.status}",
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Rs ${widget.price}",
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

class SimplePlaced extends StatefulWidget {
  SimplePlaced({
    required this.bidsplace,
    required this.price,
    required this.status,
    required this.title,
    super.key,
  });

  String title;
  int bidsplace;
  String status;
  int price;

  @override
  State<SimplePlaced> createState() => _SimplePlacedState();
}

class _SimplePlacedState extends State<SimplePlaced> {
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
        margin: EdgeInsets.only(bottom: 10),
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
                      "${widget.title}",
                      style: TextStyle(fontSize: 18),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Bids Placed:${widget.bidsplace}",
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
                    child: Text(
                      "${widget.status}",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Rs ${widget.price}",
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
