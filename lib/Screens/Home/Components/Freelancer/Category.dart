// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/Category/Projects.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Projects(categoryname: "Software"),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: const [
                          Image(
                            image: AssetImage(
                              "assets/images/editing.png",
                            ),
                          ),
                          Text("Software")
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Projects(categoryname: "Editing"),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: const [
                          Image(
                            image: AssetImage(
                              "assets/images/software.png",
                            ),
                          ),
                          Text("Editing")
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Projects(categoryname: "Writing"),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: const [
                          Image(
                            image: AssetImage("assets/images/writing.png"),
                          ),
                          Text("Writing")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
