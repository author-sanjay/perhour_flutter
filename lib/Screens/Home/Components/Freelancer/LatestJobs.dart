// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Modals/JobsModedapi.dart';
import 'package:perhour_flutter/Modals/JobsModel.dart';
import 'package:perhour_flutter/Screens/Home/Components/ListProjects.dart';

class LatestJobs extends StatefulWidget {
  const LatestJobs({
    super.key,
  });

  @override
  State<LatestJobs> createState() => _LatestJobsState();
}

class _LatestJobsState extends State<LatestJobs> {
  bool _isloading = true;
  late List<Jobs> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await JobsModelapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: Container(
          child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Latest Jobs",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _isloading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : _getdeals.length == 0
                          ? Padding(
                              padding: const EdgeInsets.all(48.0),
                              child: Center(
                                  child: Text(
                                      "Oops, We have not projects right now. Please try again in an hour")),
                            )
                          : ListProjects(
                              getjobs: _getdeals,
                            ),
                ]),
          ),
        ));
  }
}
