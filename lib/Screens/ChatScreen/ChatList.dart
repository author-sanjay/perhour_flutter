// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:chat_app_plugin/database_service.dart';
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ChatScreen/ChatScreen.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:http/http.dart' as http;
import '../../api.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  static Stream? chats;
  getusergroups() async {
    await DatabaseService(uid: user.id)
        .getusergroups()
        .then((snapshot) {
      print(snapshot);
      setState(() {
        chats = snapshot;
        print(chats);
      });
    });
  }
  @override void initState() {super.initState();getusergroups();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height),
        child: Container(
          color: backgroundwhite,
          width: MediaQuery.of(context).size.width,
          child:
            Column(children: [
              Topbar(title: "Chats",),
              ChatLists()
            ],),
        ),
      ),
    );
  }
}

class ChatLists extends StatelessWidget {
  const ChatLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all( 15),
        // width: MediaQuery.of(context).size.width,
        child: chatlist()

      );

  }

  chatlist() {
    return StreamBuilder(
      stream: _ChatListState.chats,
      builder: (context, AsyncSnapshot snapshot) {
        // make some checks
        if (snapshot.hasData) {
          // return Text("jhh");
          if (snapshot.data['chatswith'] != null) {
            if (snapshot.data['chatswith'].length != 0) {
              // return
              return  Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.8,
                  child: ListView.builder(
                      itemCount: snapshot.data['chatswith'].length,
                      itemBuilder: (BuildContext context, int index) {
                        var re=snapshot.data['chatswith'][index].split("_");

                        return Container(
                          // padding: EdgeInsets.all(20),
                          child: SingleChatTile(id: int.parse(re[0]) , username: re[1],)
                        );
                      },
                    ),
                ),
              );
                // child: ListView.separated(
                //   itemCount: snapshot.data['groups'].length,
                //   itemBuilder: (context, index) {
                //     int reverseIndex =
                //         snapshot.data['groups'].length - index + 1;
                //     return GroupTile(
                //         groupId: getId(snapshot.data['groups'][reverseIndex]),
                //         groupName:
                //             getName(snapshot.data['groups'][reverseIndex]),
                //         userName: snapshot.data['fullName']);
                //   },
                // ),

            } else {
              return nochat();
            }
          } else {
            return nochat();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor),
          );
        }
      },
    );
  }
  }
nochat() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 58.0),
      child: Column(
        children: [
          Text("Sorry You dont have any chat"),

        ],
      ),
    ),
  );
}

class SingleChatTile extends StatefulWidget {
   SingleChatTile({
    required this.id, required this.username,
    super.key,
  });
  int id;
  String username;

  @override
  State<SingleChatTile> createState() => _SingleChatTileState();
}

class _SingleChatTileState extends State<SingleChatTile> {
  static String photo="";
  static String name="";
  Future<void> finduser() async {
    print(user.id);
print(widget.username);
    var res = await http.get(Uri.parse("${api}users/findbyusername/${widget.username}" ),headers: headers);
    var result = jsonDecode(res.body);
    print(res.body);
    if(result["photo"]!=null){
    setState(() {
      _SingleChatTileState.photo=result["photo"];
    });
    }else{
      _SingleChatTileState.photo="";
    }
    setState(() {
      _SingleChatTileState.name=result["firstname"];
    });
    print(_SingleChatTileState.photo);
  }
  @override void initState() {
    super.initState();
    finduser();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ChatScreen(id: widget.id,name: "${_SingleChatTileState.name}"),),);
        },
        child: Container(width: MediaQuery.of(context).size.width*0.8, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all( 15),
          child: Row(children: [

            _SingleChatTileState.photo.length>0? CircleAvatar(
              backgroundImage: NetworkImage(_SingleChatTileState.photo),
              radius: MediaQuery.of(context).size.width*0.08,):
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/Man2.png"),
              radius: MediaQuery.of(context).size.width*0.08,),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
              child: Column(
                children: [
                  Text("${_SingleChatTileState.name.toUpperCase()}",style: TextStyle(fontSize: 18),),
                ],
              ),
            )
          ],),
        ),
      ),
    );
  }
}
