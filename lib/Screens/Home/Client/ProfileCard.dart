import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.colorss,
    required this.random,
  });

  final List colorss;
  final Random random;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20,
          // left: 30,
          right: 20,
          bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            color: colorss[random.nextInt(3)],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 28),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: Image(image: AssetImage("assets/images/Man2.png")),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      "\$ 50/hr ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, top: 10),
              child: Container(
                color: kblue,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Sanjay Kumar ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "UX Designer",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
