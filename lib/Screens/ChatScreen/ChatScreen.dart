// ignore_for_file: file_names, sized_box_for_whitespace, must_be_immutable
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chat_app_plugin/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/Screens/PostJob/PostJobAndAssign.dart';

import '../../api.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({required this.id, required this.name, Key? key});
  final int id;
  final String name;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static String photo = "";
  static int id = 0;
  static String name = "0";
  static Stream<QuerySnapshot>? chats;
  Future<void> finduser() async {
    // print(user.id);
    // print(widget.name);
    var res = await http.get(Uri.parse("${api}users/getuser/${widget.id}"),
        headers: headers);
    var result = jsonDecode(res.body);
    print(res.body);
    if (result["photo"] != null) {
      setState(() {
        _ChatScreenState.photo = result["photo"];
      });
    } else {
      _ChatScreenState.photo = "";
    }
    _ChatScreenState.name = result["username"];

    print(_ChatScreenState.photo);
  }

  chatMessages() async {
    setState(() {
      _ChatScreenState.id = widget.id;

      print(_ChatScreenState.name);
    });
    String chatid = "";
    if (int.parse(user.id) < widget.id) {
      chatid = "${user.id}_${widget.id}";
    } else {
      chatid = "${widget.id}_${user.id}";
    }
    print("${user.id}   ${widget.id}");
    print(chatid);

    DatabaseService().getchatchats(chatid).then((val) {
      setState(() {
        _ChatScreenState.chats = val;
        print(_ChatScreenState.chats);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    chatMessages();
    finduser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: SingleChildScrollView(reverse: true,child: Container(height: MediaQuery.of(context).size.height*0.08,decoration: BoxDecoration(color: kblue,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),width: MediaQuery.of(context).size.width, child: Center(child: TextFormField(decoration: InputDecoration(fillColor: backgroundwhite),),),)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: kblue,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: chatMessageslist(),
              ),
            ),
            SendBox(id: widget.id, name: widget.name),
            Positioned(
              top: 0,
              child: Container(
                color: const Color.fromARGB(247, 245, 223, 123),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    bottom: 10,
                    left: MediaQuery.of(context).size.width * 0.1),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    _ChatScreenState.photo.length > 0
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(_ChatScreenState.photo),
                          )
                        : CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/Man2.png"),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "${widget.name.toUpperCase()}",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostJobAndAssign(id: widget.id),
                            ),
                          );
                        },
                        child: Text(
                          "Hire",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  chatMessageslist() {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return snapshot.data.docs[index]['sender'] ==
                          _ChatScreenState.name
                      ? Recieved(
                          message: snapshot.data.docs[index]['message'],
                        )
                      : Sent(
                          message: snapshot.data.docs[index]['message'],
                        );
                },
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Send Your Requirements",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class Recieved extends StatefulWidget {
  Recieved({
    required this.message,
    super.key,
  });
  String message;

  @override
  State<Recieved> createState() => _RecievedState();
}

class _RecievedState extends State<Recieved> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 100, left: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: const Color.fromARGB(247, 245, 223, 123),
        ),
        width: MediaQuery.of(context).size.width * 0.6,
        child: Text("${widget.message}"),
      ),
    );
  }
}

class Sent extends StatefulWidget {
  Sent({
    required this.message,
    super.key,
  });
  String message;

  @override
  State<Sent> createState() => _SentState();
}

class _SentState extends State<Sent> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 100, right: 20),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: const Color.fromARGB(247, 245, 223, 123),
          ),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text("${widget.message}"),
        ),
      ),
    );
  }
}

class SendBox extends StatefulWidget {
  SendBox({
    required this.id,
    required this.name,
    super.key,
  });
  int id;
  String name;

  @override
  State<SendBox> createState() => _SendBoxState();
}

class _SendBoxState extends State<SendBox> {
  TextEditingController _textController = TextEditingController();
  static String message = "";
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: const BoxDecoration(
          color: const Color.fromARGB(247, 245, 223, 123),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(
              20,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: _textController,
                    onChanged: (v) {
                      setState(() {
                        _SendBoxState.message = v;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(hintText: "Your Message"),
                    maxLines: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    sendMessage(
                        int.parse(user.id),
                        user.username,
                        _ChatScreenState.id,
                        _ChatScreenState.name,
                        _SendBoxState.message);
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendMessage(int user1, String user1name, int user2, String user2name,
      String message) async {
    var chatmessage = {
      "message": message,
      "sender": user1name,
      "time": DateTime.now().millisecondsSinceEpoch
    };

    print(chatmessage);
    await DatabaseService(uid: user.id).addchat(
        user1.toString(), user1name, user2.toString(), user2name, chatmessage);
    _textController.text = "";
  }
}
