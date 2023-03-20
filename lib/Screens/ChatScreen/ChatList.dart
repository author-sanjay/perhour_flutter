import 'package:chat_app_plugin/database_service.dart';
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ChatScreen/ChatScreen.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';

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
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        child: chatlist()
        ),
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
              return  ListView.builder(
                  itemCount: snapshot.data['chatswith'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // padding: EdgeInsets.all(20),
                      child: Text("jh")
                    );
                  },
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
          Navigator.push(context,MaterialPageRoute(builder: (context) => ChatScreen(id: 0,name: ""),),);
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
