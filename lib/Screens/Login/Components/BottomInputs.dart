import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Home/Home.dart';

class BottomInputs extends StatelessWidget {
  const BottomInputs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 50, right: 50),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Email"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 50, right: 50),
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(hintText: "Password"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, left: 50, right: 50),
            child: Flexible(
                child: Text(
              "By signing in you agree with our T&Cs and privacy policies",
              style: TextStyle(fontSize: 12),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: kblue, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Center(
                      child: Text(
                    "Login in",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
