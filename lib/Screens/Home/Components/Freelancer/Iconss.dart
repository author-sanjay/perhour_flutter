import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class Iconss extends StatefulWidget {
  const Iconss({
    super.key,
  });
  static bool work = true;

  @override
  State<Iconss> createState() => _IconssState();
}

class _IconssState extends State<Iconss> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: kblue,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                Iconss.work = !Iconss.work;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Iconss.work ? Colors.white : kblue,
              ),
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Text(
                "Work",
                style: TextStyle(
                  fontSize: 15,
                  color: Iconss.work ? kblue : Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Iconss.work = !Iconss.work;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Iconss.work ? kblue : Colors.white,
              ),
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Text(
                "Hire",
                style: TextStyle(
                  fontSize: 15,
                  color: Iconss.work ? Colors.white : kblue,
                ),
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
