// ignore_for_file: file_names, avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/Home/Client/ProfileCard.dart';

class SwipeCards extends StatelessWidget {
  const SwipeCards({
    super.key,
    required this.colorss,
    required this.random,
  });

  final List colorss;
  final Random random;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileCard(colorss: colorss, random: random),
                  ProfileCard(colorss: colorss, random: random),
                  ProfileCard(colorss: colorss, random: random),
                ],
              ),
            )));
  }
}
