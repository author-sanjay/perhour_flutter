import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';


class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ConstrainedBox(constraints:BoxConstraints(minHeight: MediaQuery.of(context).size.height),child: Container(width: MediaQuery.of(context).size.width, color: kblue,child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Topbar(title: "Withdraw"),
        ),
        Container(decoration: BoxDecoration(color: Color.fromARGB(
            247, 245, 223, 123), borderRadius: BorderRadius.circular(20)),width: MediaQuery.of(context).size.width*0.9,child: Padding(
              padding: const EdgeInsets.all(30.0),

              child: Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Enter Amount",style: TextStyle(fontSize: 18),),
                        Container(height: MediaQuery.of(context).size.height*0.04,child: TextFormField(decoration: InputDecoration(disabledBorder: InputBorder.none),)),
                        Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Text("Paypal/Upi",style: TextStyle(fontSize: 18),),
                        ),
                        Container(height: MediaQuery.of(context).size.height*0.04,child: TextFormField(decoration: InputDecoration(disabledBorder: InputBorder.none),)),
                        Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Text("Banking Name",style: TextStyle(fontSize: 18),),
                        ),
                        Container(height: MediaQuery.of(context).size.height*0.04,child: TextFormField(decoration: InputDecoration(disabledBorder: InputBorder.none),))
                        , Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Text("Enter Paypal/Upi Ac number",style: TextStyle(fontSize: 18),),
                        ),
                        Container(height: MediaQuery.of(context).size.height*0.04,child: TextFormField(decoration: InputDecoration(disabledBorder: InputBorder.none),)),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: GestureDetector(onTap: (){},child: Container(width: MediaQuery.of(context).size.width*0.9, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Withdraw",style: TextStyle(fontSize: 18, color: Colors.white),)),
                      ),),),
                    )
                  ],
                ),
              ),
            ),)
      ],
    ),),),);;
  }
}
