import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // bottomNavigationBar: SingleChildScrollView(reverse: true,child: Container(height: MediaQuery.of(context).size.height*0.08,decoration: BoxDecoration(color: kblue,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),width: MediaQuery.of(context).size.width, child: Center(child: TextFormField(decoration: InputDecoration(fillColor: backgroundwhite),),),)),
      body:
    SingleChildScrollView(
      child: Container(height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(bottom: 0,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.07,
                  decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)
                      )
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left:18.0, right: 18),
                        child: TextFormField(style: TextStyle(color: Colors.white),
                        ),
                    ),
                  ),
              ),
            ),
          ],
        ),
      )
    ),);
  }
}
