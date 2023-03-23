import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:social_share/social_share.dart';

class Refer extends StatefulWidget {
  const Refer({Key? key}) : super(key: key);

  @override
  State<Refer> createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
        ),
        child: Container(color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:60,),
                child: Image(image: AssetImage("assets/images/refer.jpg")),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    Text("Refer & Earn",style: TextStyle(fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("Refer Friends and Earn on every project they complete",style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  //without an image
                  SocialShare.shareOptions("Hello world");


                },
                child: DottedBorder(
                  color: Colors.black,
                  strokeWidth: 1,
                  child: Text(user.referralcode,style: TextStyle(fontSize: 25),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
