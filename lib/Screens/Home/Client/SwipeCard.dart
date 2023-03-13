// ignore_for_file: file_names, avoid_unnecessary_containers, avoid_print, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Modals/Users/Usermodelapi.dart';
import 'package:perhour_flutter/Modals/Users/Usertop3.dart';
import 'package:perhour_flutter/Screens/Home/Client/ProfileCard.dart';

class SwipeCards extends StatefulWidget {
  const SwipeCards({
    super.key,
    required this.colorss,
    required this.random,
  });

  final List colorss;
  final Random random;

  @override
  State<SwipeCards> createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards> {
  bool _isloading = true;
  late List<User3> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Userapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return _isloading?Center(child: CircularProgressIndicator(),): Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(int i=0;i<_getdeals.length;i++)
                    ProfileCard(id: _getdeals[i].id,colorss: widget.colorss, random: widget.random,name: _getdeals[i].name, photo: _getdeals[i].photo, rates: _getdeals[i].rate.toString(),tag: _getdeals[i].tagline),

                ],
              ),
            ),),);
  }
}
