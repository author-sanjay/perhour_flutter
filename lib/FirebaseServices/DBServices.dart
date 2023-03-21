// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

class DBServices{
  final int? id;
  DBServices({this.id});

  final CollectionReference usercoll =
  FirebaseFirestore.instance.collection("users");
  final CollectionReference chats =
  FirebaseFirestore.instance.collection("chats");

  Future inituserdatawithphoto(
      int uid, String name, String email) async {
    return await usercoll.doc(uid.toString()).set({
      "uid": uid,
      "chatswith": [],
      "email": email,
      "fullname": name,
    });
  }


  Future getuserdata(String email) async {
    QuerySnapshot snapshot =
    await usercoll.where("email", isEqualTo: email).get();
    return snapshot;
  }

  finduser(String email) async {
    return usercoll.where("email", isEqualTo: email).get();
  }

  getchatchats(String chatid) async {
    return chats.doc(chatid).collection("messages").orderBy("time").snapshots();
  }

  addchat(int uid1, String firstusername, int uid2, String secondusername,
      Map<String, dynamic> chatmessage) async {
    DocumentReference user1 = await usercoll.doc(uid1.toString());
    DocumentReference user2 = await usercoll.doc(uid2.toString());
    DocumentSnapshot snap1 = await user1.get();
    DocumentSnapshot snap2 = await user2.get();
    DocumentReference chat1 = await chats.doc(uid1.toString());
    DocumentReference chat2 = await chats.doc(uid2.toString());
    DocumentSnapshot user1Snapshot = await chat1.get();
    DocumentSnapshot user2Snapshot = await chat2.get();
    String chatid = "";
    if (uid1 < uid2) {
      chatid = "${uid1}_${uid2}";
    } else {
      chatid = "${uid2}_${uid1}";
    }
    List<dynamic> user1chatswith = await snap1.get('chatswith');
    List<dynamic> user2chatswith = await snap2.get('chatswith');
    if (!user1chatswith.contains("$uid2")) {
      // user1chatswith.remove("${uid1}_$uid2");
      user1.update({
        "chatswith": FieldValue.arrayUnion(["${firstusername}"]),
      });
      user2.update({
        "chatswith": FieldValue.arrayUnion(["${secondusername}"]),
      });

      chats.doc(chatid).set({
        "user1": uid1,
        "user2": uid2,
        chatid: chatid,
      });

      chats.doc(chatid).collection("messages").add(chatmessage);
      chats.doc(chatid).update({
        "recentmessages": chatmessage['message'],
        "recentsender": chatmessage['sender'],
        "time": chatmessage['time'].toString(),
      });
    } else {
      chats.doc(chatid).collection("messages").add(chatmessage);
      chats.doc(chatid).update({
        "recentmessages": chatmessage['message'],
        "recentsender": chatmessage['sender'],
        "time": chatmessage['time'].toString(),
      });
    }
  }
}