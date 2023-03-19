import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ChatScreen/ChatScreen.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
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
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        child: Column(
          children: [
            SingleChatTile(),
            SingleChatTile(),SingleChatTile()
          ],
        ),
      ),
    );
  }
}

class SingleChatTile extends StatelessWidget {
  const SingleChatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ChatScreen(),),);
        },
        child: Container(width: MediaQuery.of(context).size.width*0.8, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all( 15),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/Man2.png"),
              radius: MediaQuery.of(context).size.width*0.08,),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
              child: Column(
                children: [
                  Text("User Name",style: TextStyle(fontSize: 18),),
                ],
              ),
            )
          ],),
        ),
      ),
    );
  }
}
