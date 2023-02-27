
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class RegisterBottom extends StatelessWidget {
  const RegisterBottom({
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
            child: Container(
                decoration: BoxDecoration(
                    color: kblue,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Center(
                    child: Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ))),
          ),
        ],
      ),
    );
  }
}
