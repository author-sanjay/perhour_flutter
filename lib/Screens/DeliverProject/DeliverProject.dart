// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/FirebaseServices/Storage.dart';
import 'package:http/http.dart' as http;
import '../../api.dart';

class DeliverProject extends StatefulWidget {
  DeliverProject(
      {required this.deadline,
      required this.id,
      required this.title,
      required this.jd,
      super.key});
  String id;
  String title;
  String jd;
  String deadline;

  @override
  State<DeliverProject> createState() => _DeliverProjectState();
}

class _DeliverProjectState extends State<DeliverProject> {
  final Storage storage = Storage();

  static bool selected = false;
  static String link = "";

  @override
  void initState() {
    super.initState();
    _DeliverProjectState.selected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            color: backgroundwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 35, bottom: 15),
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Deliver Project",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    "${widget.title.toUpperCase()}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Text(
                    "${widget.deadline}",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Job Description",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "${widget.jd}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Upload Work",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final results = await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.any,
                            );
                            if (results == null) {
                              print(
                                results.toString(),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("File not selected"),
                                ),
                              );
                              return null;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("File selected"),
                                ),
                              );
                            }
                            final path = results.files.single.path;
                            final filename = results.files.single.name;
                            // ignore: avoid_print
                            storage.uploadfile(path!, filename).then(
                              ((result) {
                                // deals("", "", "", "", "", "", 0, widget.photourl!);

                                setState(() {
                                  // deal.photo = result;
                                  // widget.photo = result;
                                  _DeliverProjectState.link = result;
                                  print(_DeliverProjectState.link);
                                  _DeliverProjectState.selected = true;

                                  // user.photo = result;
                                  // updatephoto(result);
                                });
                                // setState(() async {
                                //
                                //   _DeliverProjectState.link=result.toString();
                                //   print(result);

                                //   _DeliverProjectState.selected=true;
                                // });
                              }),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _DeliverProjectState.selected
                                ? Text("File Uploaded")
                                : Text("File Not Selected"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              deliverr();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deliverr() async {
    print(widget.id);
    final json = jsonEncode({"deliverylink": _DeliverProjectState.link});
    var res = await http.post(Uri.parse(api + "projects/submit/${widget.id}"),
        body: json, headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    Navigator.pop(context);
  }
}
