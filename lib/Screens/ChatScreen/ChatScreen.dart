// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';

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

            Positioned(child: Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,color: kblue,)),
            Positioned( top: MediaQuery.of(context).size.height*0.12,
              child: Container(width: MediaQuery.of(context).size.width,child:
                 Center(
                        child: Column(
                          children: [
                            Sent(),
                            Recieved()],))),
            ),

            SendBox(),
            Positioned(top: 0,child: Container(color:const Color.fromARGB(247, 245, 223, 123),padding: EdgeInsets.only( top: MediaQuery.of(context).size.height*0.04,bottom: 10,left: MediaQuery.of(context).size.width*0.1),width: MediaQuery.of(context).size.width,child: Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage("assets/images/Man2.png"),),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text("User Name",style: TextStyle(fontSize: 18,color: Colors.black),),
                ),
              ],
            )),)
          ],
        ),
      )
    ),);
  }
}

class Recieved extends StatelessWidget {
  const Recieved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,right: 100),
      child: Container(
        padding: EdgeInsets.all( 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          color: const Color.fromARGB(247, 245, 223, 123),),
        width: MediaQuery.of(context).size.width*0.6,
        child: Text("hjhjhjhjhjhjhjhjhjhj"),),
            );
  }
}

class Sent extends StatelessWidget {
  const Sent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(right:20,
      child: Padding(
        padding: const EdgeInsets.only(top:8.0,left: 100),
        child: Container(
          padding: EdgeInsets.all( 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)
            ),
            color: const Color.fromARGB(247, 245, 223, 123),),
          width: MediaQuery.of(context).size.width*0.6,
          child: Text("hjhjhjhjhjhjhjhjhjhj"),
        ),
      ),
    );
  }
}

class SendBox extends StatelessWidget {
  const SendBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(bottom: 0,
      child: Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.07,
          decoration: const BoxDecoration(
              color: const Color.fromARGB(247, 245, 223, 123),
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                  topLeft: Radius.circular(20)
              )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20),
                child: Row(
                  children: [
                    Container(width: MediaQuery.of(context).size.width*0.8,
                      child: TextFormField(style: const TextStyle(color: Colors.black),decoration: InputDecoration(hintText: "Your Message"), maxLines: 10,
                      ),
                    ),
                    Icon(Icons.send)
                  ],
                ),
            ),
          ),
      ),
    );
  }
}
