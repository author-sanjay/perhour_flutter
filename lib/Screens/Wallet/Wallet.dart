// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Wallettxns/Txnapi.dart';
import 'package:perhour_flutter/Modals/Wallettxns/Txnmodel.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/Screens/Wallet/JobDetailsClosed.dart';
import 'package:http/http.dart' as http;

import '../../api.dart';
class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);
  static bool earning = true;

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  static double? walletid;
 @override void initState() {
   super.initState();
   wallet();
 }

 Future<void> wallet() async {Map<String, String> headers = {
       "Content-type"
       :
       "application/json"};var res = await http.get(Uri.parse(api+"wallet/balance/${user.id}"),headers: headers);
       print(res.body);
       if(res.body.isNotEmpty){
         setState(() {
           _WalletState.walletid=jsonDecode(res.body);
           print(_WalletState.walletid);
         });
       }
       }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Container(
            color: kblue,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: kblue,
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: const Center(
                    child: Text(
                      "Earnings",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 28.0, left: 20, right: 20, bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(247, 245, 223, 123),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(38.0),
                              child: Column(
                                children: [
                                  Wallet.earning
                                      ? Column(
                                        children: [
                                          Text("Total Earning"),
                                          Text(
                                            "Rs ${_WalletState.walletid}",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      )
                                      : Column(
                                        children: [
                                          Text("Referral Earnings"),
                                        ],
                                      ),

                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 28, bottom: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (!Wallet.earning) {
                                            Wallet.earning = true;
                                          }
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Wallet.earning
                                                ? Colors.black
                                                : const Color.fromARGB(
                                                    247, 245, 223, 123),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "Earning",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Wallet.earning
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 28.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (Wallet.earning) {
                                            Wallet.earning = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Wallet.earning
                                                ? const Color.fromARGB(
                                                    247, 245, 223, 123)
                                                : Colors.black,
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "Referrals",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Wallet.earning
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 8, right: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "WithDraw",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 0.60,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wallet.earning
                              ? const Text(
                                  "Project Earnings",
                                  style: TextStyle(fontSize: 18),
                                )
                              : const Text("Referrals"),
                          Wallet.earning
                              ? const TxnList()
                              : const ReferralList()
                        ],
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
}

class ReferralList extends StatelessWidget {
  const ReferralList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: GestureDetector(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  // color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Sanjay Kumar",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Rs 10000",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}

class TxnList extends StatefulWidget {
  const TxnList({
    super.key,
  });

  @override
  State<TxnList> createState() => _TxnListState();
}

class _TxnListState extends State<TxnList> {
  bool _isloading = true;
  late List<Txn> _getdeals;
  @override void initState() {super.initState();getDeals();}
  Future<void> getDeals() async {
    _getdeals = await Txnapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }
  @override
  Widget build(BuildContext context) {
    return _isloading?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
      child: ConstrainedBox( constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height*0.6),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _getdeals.length,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: _getdeals[index].incoming?GestureDetector(

                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobDetailsClosed(id: _getdeals[index].projectid),
                    ),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    // color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                _getdeals[index].projectname,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                               Text(
                                _getdeals[index].amount.toString(),
                                style:
                                TextStyle(fontSize: 16, color: Colors.green),
                               )
                            ],
                          ),
                        )
                      ],
                    )),
              ):GestureDetector(


                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    // color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                _getdeals[index].projectname,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                               Text(
                                "${_getdeals[index].amount}",
                                style:
                                TextStyle(fontSize: 16, color: Colors.red),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
