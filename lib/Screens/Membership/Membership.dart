// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers, unused_field, avoid_print, prefer_final_fields, no_leading_underscores_for_local_identifiers, must_be_immutable

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Membership/Membership.dart';
import 'package:perhour_flutter/Modals/Membership/Membershipapi.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);
  static bool monthly = false;
  static late bool member;
  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final snackbar = const SnackBar(
    content: Text(
      "Payment Error. Please Try after Some Time",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  static int membershipid = 0;

  static Razorpay _razorpay = Razorpay();

  bool monthly = true;
  String name = "";
  int price = 0;
  int bids = 0;
  String desc = "";

  bool _isloading = true;
  late List<Member> _getdeals;

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    print("success");
    print(_MembershipState.membershipid);
    var res = await http.post(
        Uri.parse(
            "${api}users/addmembership/${user.id}/${_MembershipState.membershipid}"),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    Navigator.pop(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Fail");
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  void dispose() {
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }

  @override
  void initState() {
    super.initState();
    print("hello");

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getDeals();
  }

  Future<void> membershipdetails() async {
    var res = await http.get(
        Uri.parse("${api}membership/getsingle/${user.membershipid}"),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    setState(() {
      monthly = result["montly"];
      name = result["name"];
      price = result["price"];
      desc = result["description"];
      bids = result["extendedbids"];
      print(desc);
    });
  }

  Future<void> getDeals() async {
    print(user.membershipid);
    if (user.membershipid == 0) {
      print(user.membershipid);
      setState(() {
        Membership.member = false;
      });
    } else {
      Membership.member = true;
    }
    _getdeals = await Memberapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
    splitdata(_getdeals);
    membershipdetails();
  }

  static List<Member> _monthly = [];
  static List<Member> _yearly = [];
  splitdata(List<Member> _getdeals) {
    for (int i = 0; i < _getdeals.length; i++) {
      if (_getdeals[i].monthly) {
        setState(() {
          _MembershipState._monthly.add(_getdeals[i]);
        });
      } else {
        setState(() {
          _MembershipState._yearly.add(_getdeals[i]);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    List coolors = [
      const Color(0xFFFFC0C0),
      const Color(0xFFB9F8AE),
      const Color(0xFFAED0F8),
      const Color(0xFFD7AEF8),
      const Color(0xFFF8AEF1)
    ];
    return Scaffold(
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: backgroundwhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 68.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Image(
                            image: AssetImage(
                              "assets/images/vip.png",
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Text(
                          "Get VIP",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 18.0, left: 20, right: 20),
                        child: Text(
                          "Designed to maximise your freelancer success and earnings!",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Membership.member
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 28.0, bottom: 10),
                              child: Container(
                                child: const Text(
                                  "Your Memership",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.25,
                                  top: 20),
                              alignment: Alignment.topCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (!Membership.monthly) {
                                          Membership.monthly = true;
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Membership.monthly
                                            ? kblue
                                            : backgroundwhite,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        "Monthly",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Membership.monthly
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (Membership.monthly) {
                                          Membership.monthly = false;
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Membership.monthly
                                            ? backgroundwhite
                                            : kblue,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        "Yearly",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Membership.monthly
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                      if (Membership.member)
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 20),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: coolors[random.nextInt(5)],
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 38.0, left: 20, right: 20),
                                          child: Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        monthly
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0,
                                                    left: 20,
                                                    right: 20),
                                                child: Text(
                                                  "@$price/month",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0,
                                                    left: 20,
                                                    right: 20),
                                                child: Text(
                                                  "@$price/year",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 18.0),
                                          child: Column(
                                            children: [
                                              const Text(
                                                ("Bids Left:"),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "${user.bidsleft}/$bids"),
                                              ),
                                              const Text(
                                                ("Valid Till: "),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "${user.membershipexpiry} "),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Membership.member = false;
                                  });
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: kblue,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: const Center(
                                    child: Text(
                                      "Extend Membership",
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
                        )
                      else
                        Membership.monthly
                            ? Monthly(
                                coolors: coolors,
                                random: random,
                                monthly: _getdeals)
                            : Yearly(
                                coolors: coolors,
                                random: random,
                                yearly: _getdeals,
                              )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class Yearly extends StatefulWidget {
  Yearly({
    required this.yearly,
    super.key,
    required this.coolors,
    required this.random,
  });
  List<Member> yearly;
  final List coolors;
  final Random random;

  @override
  State<Yearly> createState() => _YearlyState();
}

class _YearlyState extends State<Yearly> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              children: [
                for (int i = 0; i < widget.yearly.length; i++)
                  widget.yearly[i].monthly
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              addmembership(
                                  widget.yearly[i].id, widget.yearly[i].price);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: widget.coolors[widget.random.nextInt(5)],
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 38.0, left: 20, right: 20),
                                    child: Text(
                                      widget.yearly[i].title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 20, right: 20),
                                    child: Text(
                                      "@${widget.yearly[i].price}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, left: 20, right: 20),
                                    child: Text(
                                      "Benefits",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Benifits(
                                    benifits: widget.yearly[i].benefits,
                                  )
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

  addmembership(int membershipid, int amount) async {
    _MembershipState.membershipid = membershipid;

    print(amount);
    final json = jsonEncode({
      "customername": user.firstname + " " + user.lastname,
      "customeremail": user.email,
      "amount": amount * 100
    });
    http
        .post(Uri.parse(api + 'pay/createorder'), headers: headers, body: json)
        .then((value) {
      print(value.body);
      var result = jsonDecode(value.body);
      var options = {
        'key': result["secretkey"],
        'amount': amount * 100, //in the smallest currency sub-unit.
        'name': '${user.firstname} ${user.lastname}',
        'order_id':
            result["razorpayorderid"], // Generate order_id using Orders API
        'description': 'Membership id ${membershipid}',
        'timeout': 60, // in seconds
        'prefill': {'email': user.email}
      };

      _MembershipState._razorpay.open(options);
    });
  }
}

class Benifits extends StatelessWidget {
  const Benifits({
    super.key,
    required this.benifits,
  });

  final String benifits;

  @override
  Widget build(BuildContext context) {
    var l = benifits.split("\r");
    print(l);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < l.length; i++)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
            child: Text(
              l[i],
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }
}

class Monthly extends StatefulWidget {
  Monthly({
    required this.monthly,
    super.key,
    required this.coolors,
    required this.random,
  });
  List<Member> monthly;

  final List coolors;
  final Random random;

  @override
  State<Monthly> createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              children: [
                for (int i = 0; i < widget.monthly.length; i++)
                  widget.monthly[i].monthly
                      ? Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              addmembership(widget.monthly[i].id,
                                  widget.monthly[i].price);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: widget.coolors[widget.random.nextInt(5)],
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 38.0, left: 20, right: 20),
                                    child: Text(
                                      widget.monthly[i].title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 20, right: 20),
                                    child: Text(
                                      "@${widget.monthly[i].price}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, left: 20, right: 20),
                                    child: Text(
                                      "Benefits",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Benifits(benifits: widget.monthly[i].benefits)
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  addmembership(int membershipid, int amount) async {
    _MembershipState.membershipid = membershipid;
    print(amount);
    final json = jsonEncode({
      "customername": user.firstname + " " + user.lastname,
      "customeremail": user.email,
      "amount": amount * 100
    });
    http
        .post(Uri.parse(api + 'pay/createorder'), headers: headers, body: json)
        .then((value) {
      print(value.body);
      var result = jsonDecode(value.body);
      var options = {
        'key': result["secretkey"],
        'amount': amount * 100, //in the smallest currency sub-unit.
        'name': '${user.firstname} ${user.lastname}',
        'order_id':
            result["razorpayorderid"], // Generate order_id using Orders API
        'description': 'Membership id ${membershipid}',
        'timeout': 60, // in seconds
        'prefill': {'email': user.email}
      };

      _MembershipState._razorpay.open(options);
    });
  }
}
