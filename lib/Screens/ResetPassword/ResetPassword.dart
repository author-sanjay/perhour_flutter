import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  static String currentpassword="";
  static String newpassword="";
  static String confirmpassword="";
  final snackbar = const SnackBar(content: Text("Password Dont match. Please Try again",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
  final success = const SnackBar(content: Text("Password Changed Successfully",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:BoxConstraints(
            minHeight: MediaQuery.of(context).size.height),
        child: Container(
          color: backgroundwhite,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Topbar(title: "Forgot Password",),
            Padding(
              padding: const EdgeInsets.only(top:28.0),
              child: Container(
                padding: EdgeInsets.all( 20),
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text("New Password",style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(onChanged: (v){
                        _ResetPasswordState.newpassword=v;
                      },obscureText: true,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text("Confirm Password",style: TextStyle(fontSize: 16),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(onChanged: (v){
                        _ResetPasswordState.confirmpassword=v;
                      },obscureText: false,),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GestureDetector(
                        onTap: (){
                          changepassword();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all( 10),
                          child: Center(
                              child: Text("Save Password",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                              ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
          ),
        ),
      ),
    );
  }

  bool validatepassword(id, id2){
    if(id==id2){
      return true;
    }
    return false;
  }
  void changepassword() async {
    if(validatepassword(_ResetPasswordState.confirmpassword, _ResetPasswordState.newpassword)){
      var res = await http.post(Uri.parse(api + 'users/changepassword/${user.id}/${_ResetPasswordState.newpassword}'),headers: headers);
      var result = jsonDecode(res.body);
      print(result);
      ScaffoldMessenger.of(context).showSnackBar(success);
      Navigator.pop(context);

    }else{
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
