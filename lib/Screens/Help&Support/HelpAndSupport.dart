// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';
class Help extends StatefulWidget {
  const Help({super.key});

  static bool hourly = true;
  @override
  State<Help> createState() => _Help();
}

class _Help extends State<Help> {
  static String name="";
  static String email="";
  static String message="";
  static String phone="";
  static String subject="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Container(
            color: backgroundwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Topbar(
                  title: "Help & Support",
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          onChanged: (v){setState(() {
                            _Help.name=v;
                          });},
                          decoration: const InputDecoration(hintText: "Alex"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Subject",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          onChanged: (v){setState(() {
                            _Help.subject=v;
                          });},
                          decoration: const InputDecoration(hintText: "Reporting a Bug"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          onChanged: (v){setState(() {
                            _Help.email=v;
                          });},
                          decoration: const InputDecoration(
                              hintText: "\$alexsomething@gmail.com"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Contact Number",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          onChanged: (v){setState(() {
                            _Help.phone=v;
                          });},
                          decoration: const InputDecoration(hintText: "+157******89"),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Message",
                          style: TextStyle(

                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            // color: kblue,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child:  TextField(
                              onChanged: (v){setState(() {
                                _Help.message=v;
                              });},
                              // style: TextStyle(height: 300),
                              minLines: 5,
                              maxLines: 100,
                              decoration: InputDecoration(
                                hintText: "I Have a Problem that...",
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 20, bottom: 10),
                  child: GestureDetector(
                    onTap: (){
                      posthelp();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: kblue, borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Post",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

   posthelp() async{
final json=jsonEncode({
"message":_Help.message,
"subject":_Help.subject,
  "email":_Help.email,
  "phone":_Help.phone

});


  var res = await http.post(Uri.parse(api + 'help/add/${user.id}'),body: json,headers: headers);
  var result = jsonDecode(res.body);
  print(result);
  Navigator.pop(context);

  }
}
