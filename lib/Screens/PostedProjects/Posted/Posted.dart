// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, file_names, prefer_const_constructors_in_immutables, avoid_print, sized_box_for_whitespace, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Projects/Posted/Posted.dart';
import 'package:perhour_flutter/Modals/Projects/Posted/Postedapi.dart';
import 'package:perhour_flutter/Screens/DeliverProject/GetDelivery.dart';
import 'package:perhour_flutter/Screens/DeliverProject/SendFeedback.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
import 'package:perhour_flutter/api.dart';
import 'package:http/http.dart' as http;
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
        ? const Center(
            child: CircularProgressIndicator(
              color: kblue,
            ),
          )
        : Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                for (int i = 0; i < _getdeals.length; i++)
                  if (_getdeals[i].status == "Placed")
                    SimplePlaced(
                      id: _getdeals[i].id,
                      bidsplace: _getdeals[i].bids,
                      price: _getdeals[i].price,
                      status: _getdeals[i].status,
                      title: _getdeals[i].title,
                    )
                  else if (_getdeals[i].status == "Delivered")
                    Checkdelivery(
                      id: _getdeals[i].id,
                      bidsplace: _getdeals[i].bids,
                      price: _getdeals[i].price,
                      status: _getdeals[i].status,
                      title: _getdeals[i].title,
                    )
                  else if (_getdeals[i].status == "Completed")
                    Feedback(
                      id: _getdeals[i].id,
                      bidsplace: _getdeals[i].bids,
                      price: _getdeals[i].price,
                      status: _getdeals[i].status,
                      title: _getdeals[i].title,
                      description: _getdeals[i].fulldesc,
                    )
                  else if (_getdeals[i].status == "Assigned")
                    Assigned(
                      id: _getdeals[i].id,
                      // bidsplace: _getdeals[i].bids,
                      price: _getdeals[i].price,
                      status: _getdeals[i].status,
                      title: _getdeals[i].title,
                      deliverydate: _getdeals[i].time,
                    ),
                // Checkdelivery(),
                // Feedback()
              ],
            ),
          );
  }
}

class Assigned extends StatefulWidget {
  Assigned({
    required this.id,
    required this.deliverydate,
    required this.price,
    required this.status,
    required this.title,
    super.key,
  });
  int id;
  String title;
  String deliverydate;
  String status;
  int price;

  @override
  State<Assigned> createState() => _AssignedState();
}

class _AssignedState extends State<Assigned> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This action cannot be undone '),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Revoke'),
              onPressed: () {
                revoke(widget.id);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
                        widget.title,
                        style: TextStyle(fontSize: 18),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Delivery Date",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(
                          widget.deliverydate,
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
                      child: const Text(
                        "Assigned",
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
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Center(
                    child: Text(
                  "Chat With Freelancer",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
              ),
              GestureDetector(
                onTap: () {
                  _showMyDialog();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kblue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Center(
                      child: Text(
                    "Revoke Project",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  revoke(int id) async {
    var res = await http.post(Uri.parse(api + "projects/revoke/${widget.id}"),
        headers: headers);
    // if (jsonDecode(res.body)) {
    //   Navigator.pop(context);
    // }
    var result = jsonDecode(res.body);
    print(result);
    Navigator.pop(context);
  }
}

class Feedback extends StatefulWidget {
  Feedback({
    required this.id,
    required this.bidsplace,
    required this.price,
    required this.status,
    required this.title,
    required this.description,
    super.key,
  });
  int id;
  String title;
  int bidsplace;
  String status;
  int price;
  String description;

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
              builder: (context) => SendFeedBack(
                  id: widget.id, desc: widget.description, title: widget.title),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
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
                        style: const TextStyle(fontSize: 18),
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
                    ),
                  ),
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
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Rs ${widget.price}",
                      style: const TextStyle(fontSize: 20, color: Colors.green),
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
    required this.id,
    required this.bidsplace,
    required this.price,
    required this.status,
    required this.title,
    super.key,
  });
  int id;
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
          margin: const EdgeInsets.only(bottom: 10),
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
                        style: const TextStyle(fontSize: 18),
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
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Rs ${widget.price}",
                      style: const TextStyle(fontSize: 20, color: Colors.green),
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
    required this.id,
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
  int id;

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
            builder: (context) => ListBids(id: widget.id),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
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
                      style: const TextStyle(fontSize: 18),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Bids Placed:${widget.bidsplace}",
                    style: const TextStyle(fontSize: 15),
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
                      style: const TextStyle(fontSize: 14, color: Colors.red),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Rs ${widget.price}",
                    style: const TextStyle(fontSize: 20, color: Colors.green),
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
