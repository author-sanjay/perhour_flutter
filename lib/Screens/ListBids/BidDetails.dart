// ignore_for_file: file_names, sized_box_for_whitespace, must_be_immutable, prefer_interpolation_to_compose_strings, avoid_print, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/api.dart';

class BidsDetails extends StatefulWidget {
  BidsDetails(
      {required this.description,
      required this.price,
      required this.time,
      required this.projectid,
      required this.revisions,
      required this.userid,
      super.key});
  int projectid;
  int time;
  int price;
  String description;
  int revisions;
  int userid;

  @override
  State<BidsDetails> createState() => _BidsDetailsState();
}

class _BidsDetailsState extends State<BidsDetails> {
  static String photo = "";
  Future<void> name() async {
    var res = await http.get(Uri.parse(api + 'users/getuser/${widget.userid}'),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    setState(() {
      if (result["photo"] != null) {
        photo = result["photo"];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    name();
  }

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
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
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
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: photo.length > 0
                            ? Image(image: NetworkImage(photo))
                            : const Image(
                                image: AssetImage("assets/images/Man2.png")),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time: ${widget.time} Days",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "Revisions: ${widget.revisions}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "Rs ${widget.time} Days",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.green),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(widget.description),
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

                            child: const Text(
                              "Chat With Freelancer",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              assignproject(widget.userid, widget.projectid);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.175,
                                  right:
                                      MediaQuery.of(context).size.width * 0.175,
                                  top: 8,
                                  bottom: 8),
                              decoration: BoxDecoration(
                                  color: kblue,
                                  borderRadius: BorderRadius.circular(10)),
                              // width: MediaQuery.of(context).size.width * 0.8,

                              child: const Text(
                                "Assign Project",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
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

  assignproject(int user, int project) async {
    print(project);

    var res = await http.post(
        Uri.parse(api + "projects/assignproject/${user}/${project}"),
        headers: headers);
    print(res.statusCode);
    var result = jsonDecode(res.body);
    print(result);
    // if(res.statusCode)
  }
}
