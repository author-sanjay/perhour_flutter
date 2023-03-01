import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';

class ApplyJob extends StatelessWidget {
  const ApplyJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        // color: kblue,
        child: Column(
          children: [
            Container(
              child: Text(
                "Submit Proposal",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      )),
    );
  }
}
