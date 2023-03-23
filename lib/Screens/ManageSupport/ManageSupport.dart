// ignore_for_file: file_names, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/HelpandSupport/TheSupport.dart';
import 'package:perhour_flutter/Modals/HelpandSupport/TheSupportModel.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
import 'package:http/http.dart' as http;
import '../../api.dart';

class ManageSupport extends StatefulWidget {
  const ManageSupport({Key? key}) : super(key: key);

  @override
  State<ManageSupport> createState() => _ManageSupportState();
}

class _ManageSupportState extends State<ManageSupport> {
  bool _isloading = true;
  late List<TheSupport> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await TheSupportapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: _isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: backgroundwhite,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: Topbar(
                          title: "Manage Support",
                        ),
                      ),
                      // _getdeals.length==0?Container(child: Center(child: Text("No Issues Raised"),),):
                      for (int i = 0; i < _getdeals.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text("Subject: "),
                                      Text(
                                        _getdeals[i].subject.toUpperCase(),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Message: "),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(_getdeals[i].message),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text("Email: "),
                                      Text(
                                        _getdeals[i].email.toUpperCase(),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text("Phone No.: "),
                                      Text(
                                        _getdeals[i].phone.toUpperCase(),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      markcomplete(_getdeals[i].id);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: kblue,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: const Center(
                                        child: Text(
                                          "Resolved",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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

  void markcomplete(int id) async {
    var res =
        await http.post(Uri.parse("${api}help/resolve/$id"), headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    Navigator.pop(context);
  }
}
