// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/Wallet/JobDetailsClosed.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);
  static bool earning = true;

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
                                      ? const Text("Total Earning")
                                      : const Text("Referral Earning"),
                                  const Text(
                                    "\$ 500",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
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

class TxnList extends StatelessWidget {
  const TxnList({
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JobDetailsClosed(),
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
                          children: const [
                            Text(
                              "App Development",
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
