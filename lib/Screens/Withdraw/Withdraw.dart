// ignore_for_file: file_names, sized_box_for_whitespace, empty_statements, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';


class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  static double amount=0;
  static String method="";
  static String name="";
  final snackbar =  const SnackBar(content: Text("Withdraw request sent. Money will be credited to your account in 48 hrs"),);
  static String ac="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ConstrainedBox(constraints:BoxConstraints(minHeight: MediaQuery.of(context).size.height),child: Container(width: MediaQuery.of(context).size.width, color: kblue,child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Topbar(title: "Withdraw"),
        ),
        Container(decoration: BoxDecoration(color: const Color.fromARGB(
            247, 245, 223, 123), borderRadius: BorderRadius.circular(20)),width: MediaQuery.of(context).size.width*0.9,child: Padding(
              padding: const EdgeInsets.all(30.0),

              child: Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Enter Amount",style: TextStyle(fontSize: 18),),
                        Container(height: MediaQuery.of(context).size.height*0.04,child:
                        TextFormField(onChanged: (v){
                          setState(() {
                            _WithdrawState.amount=double.parse(v);
                          });
                        },keyboardType: TextInputType.number, decoration: const InputDecoration(disabledBorder: InputBorder.none),)),
                        const Padding(
                          padding: EdgeInsets.only(top:18.0),
                          child: Text("Paypal/Upi",style: TextStyle(fontSize: 18),),
                        ),
                        Container(height: MediaQuery.of(context).size.height*0.04,child: TextFormField(onChanged: (v){
                          setState(() {
                            _WithdrawState.method=v;
                          });
                        },decoration: const InputDecoration(disabledBorder: InputBorder.none),)),
                        const Padding(
                          padding: EdgeInsets.only(top:18.0),
                          child: Text("Banking Name",style: TextStyle(fontSize: 18),),
                        ),
                        Container(height: MediaQuery.of(context).size.height*0.04,child: TextFormField(onChanged: (v){
                          setState(() {
                            _WithdrawState.name=v;
                          });
                        },decoration: const InputDecoration(disabledBorder: InputBorder.none),))
                        , const Padding(
                          padding: EdgeInsets.only(top:18.0),
                          child: Text("Enter Paypal/Upi Ac number",style: TextStyle(fontSize: 18),),
                        ),
                        Container(height: MediaQuery.of(context).size.height*0.04,child: TextFormField(onChanged: (v){
                          setState(() {
                            _WithdrawState.ac=v;
                          });
                        },decoration: const InputDecoration(disabledBorder: InputBorder.none),)),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: GestureDetector(onTap: (){
                        post();
                      },child: Container(width: MediaQuery.of(context).size.width*0.9, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text("Withdraw",style: TextStyle(fontSize: 18, color: Colors.white),)),
                      ),),),
                    )
                  ],
                ),
              ),
            ),)
      ],
    ),),),);
  }

  void post() async {
    final json=jsonEncode({

    });
    var res = await http.post(Uri.parse('${api}help/withdrawll/${_WithdrawState.amount}/${_WithdrawState.method}/${_WithdrawState.name}/${_WithdrawState.ac}/${user.id}'),headers: headers,body: json);var result = jsonDecode(res.body);print(result);
Navigator.pop(context);
  }
}
