import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      Spacer(),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.92,
                  decoration: BoxDecoration(color: kblue),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: ProfilePhoto(),
                      ),
                      EditDetails()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditDetails extends StatelessWidget {
  const EditDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: MediaQuery.of(context).size.height * 0.64,
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0, left: 30, right: 3),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "alexsomething@gmail.com"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Somewhere in Heaven"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Withdrawl Type",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "UPI/Paypal"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Withdrawl A/C",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "UPI Id/ PayPal Id"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30, top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Banking Name",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Alex"),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: MediaQuery.of(context).size.width * 0.2,
        ),
      )),
    );
  }
}
