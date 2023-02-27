import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class Iconss extends StatelessWidget {
  const Iconss({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: kblue,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        children: const [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Spacer(),
          Icon(
            Icons.work,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
