// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Modals/Users/Usermodelapi.dart';
import 'package:perhour_flutter/Modals/Users/Usertop3.dart';
import 'package:perhour_flutter/Screens/FreelancerProfile/FreelancerProfile.dart';

class FreelancersList extends StatefulWidget {
  const FreelancersList({
    super.key,
  });

  @override
  State<FreelancersList> createState() => _FreelancersListState();
}

class _FreelancersListState extends State<FreelancersList> {
  bool _isloading = true;
  late List<User3> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Userapi.gettop15();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }
  @override
  Widget build(BuildContext context) {
    return _isloading?Center(child: CircularProgressIndicator(),): ListView.separated(
      shrinkWrap: true,
      itemCount: _getdeals.length,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FreelancerProfile(id: _getdeals[index].id),
                ),
              );
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(10),
                // color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: const Image(
                            image: AssetImage("assets/images/Man2.png")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              "${_getdeals[index].name.toUpperCase()}",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "${_getdeals[index].tagline.toUpperCase()}",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      child: Column(
                        children:  [
                          Text(
                            "Price",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Rs ${_getdeals[index].rate.toString()} /hr",
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
