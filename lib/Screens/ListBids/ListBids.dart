// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Bids/BIdModelapi.dart';
import 'package:perhour_flutter/Modals/Bids/BidsModel.dart';
import 'package:perhour_flutter/Screens/ListBids/BidDetails.dart';

class ListBids extends StatefulWidget {
  ListBids({required this.id, super.key});
  int id;
  @override
  State<ListBids> createState() => _ListBidsState();
}

class _ListBidsState extends State<ListBids> {
  bool _isloading = true;
  late List<Bids> _getdeals;

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await BidModelapi.getDeals(widget.id);

    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: backgroundwhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Topbar(title: "Bids"),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20, top: 20),
                        child: Text(
                          "Bids",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      _getdeals.length == 0
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Center(
                                child: Text(
                                  "No Bids Yet",
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 18.0, right: 20),
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: _getdeals.length,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (_, __) => const Divider(),
                                itemBuilder: (context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BidsDetails(
                                              username:
                                                  _getdeals[index].username,
                                              description:
                                                  _getdeals[index].desc,
                                              price: _getdeals[index].price,
                                              time: _getdeals[index].time,
                                              projectid: widget.id,
                                              revisions:
                                                  _getdeals[index].revesion,
                                              userid: _getdeals[index].user,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        // color: Colors.white,
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _getdeals[index]
                                                        .username
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Text(
                                                      _getdeals[index].desc,
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Time: ${_getdeals[index].time} Days",
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Rs ${_getdeals[index].price}",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.green),
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
  Topbar({
    required this.title,
    super.key,
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      color: kblue,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
