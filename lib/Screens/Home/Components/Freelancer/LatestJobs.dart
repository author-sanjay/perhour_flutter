import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/Home/Components/ListProjects.dart';

class LatestJobs extends StatelessWidget {
  const LatestJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: Container(
          child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Latest Jobs",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListProjects(),
                ]),
          ),
        ));
  }
}
