import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class TopLogin extends StatelessWidget {
  const TopLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kblue,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60),
            child: Image(
              image: AssetImage("assets/images/login.png"),
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Spacer(),
          Text(
            "Login",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
