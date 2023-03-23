// ignore_for_file: file_names, sized_box_for_whitespace, must_be_immutable, prefer_interpolation_to_compose_strings, avoid_print, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/ChatScreen/ChatScreen.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BidsDetails extends StatefulWidget {
  BidsDetails(
      {required this.description,
      required this.price,
      required this.time,
      required this.projectid,
      required this.revisions,
      required this.userid,
      required this.username,
      super.key});
  int projectid;
  int time;
  int price;
  String description;
  int revisions;
  int userid;
  String username;

  @override
  State<BidsDetails> createState() => _BidsDetailsState();
}

class _BidsDetailsState extends State<BidsDetails> {
  final snackbar = const SnackBar(
    content: Text(
      "Payment Error. Please Try after Some Time",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );

  static Razorpay _razorpay = new Razorpay();

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    print("1234");
    var res = await http.post(
        Uri.parse(api +
            "projects/assignproject/${widget.userid}/${widget.projectid}"),
        headers: headers);
    print(res.statusCode);
    print(res.body);
    var result = jsonDecode(res.body);
    print(result);
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

  static String photo = "";
  static String namee = "";
  static String username = "";
  Future<void> name() async {
    var res = await http.get(Uri.parse(api + 'users/getuser/${widget.userid}'),
        headers: headers);
    var result = jsonDecode(res.body);
    print(result);
    setState(() {
      if (result["photo"] != null) {
        photo = result["photo"];
      }
      namee = result["firstname"];
      username = result["username"];
    });
  }

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    name();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Container(
            color: backgroundwhite,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  color: kblue,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text(
                      "Bid Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: photo.length > 0
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(photo),
                                radius: MediaQuery.of(context).size.width * 0.1,
                              )
                            : const Image(
                                image: AssetImage(
                                  "assets/images/Man2.png",
                                ),
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "${namee.toUpperCase()}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 20, top: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time: ${widget.time} Days",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "Revisions: ${widget.revisions}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "Rs ${widget.price}",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.green),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(widget.description),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                      id: widget.userid, name: username),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.1,
                                  right:
                                      MediaQuery.of(context).size.width * 0.1,
                                  top: 8,
                                  bottom: 8),
                              decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              // width: MediaQuery.of(context).size.width * 0.8,

                              child: const Text(
                                "Chat With Freelancer",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              assignproject(widget.userid, widget.projectid);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.175,
                                  right:
                                      MediaQuery.of(context).size.width * 0.175,
                                  top: 8,
                                  bottom: 8),
                              decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              // width: MediaQuery.of(context).size.width * 0.8,

                              child: const Text(
                                "Assign Project",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  assignproject(int userr, int project) async {
    print(project);
    final json = jsonEncode({
      "customername": user.firstname + " " + user.lastname,
      "customeremail": user.email,
      "amount": widget.price * 100
    });
    http
        .post(Uri.parse(api + 'pay/createorder'), headers: headers, body: json)
        .then((value) {
      print(value.body);
      var result = jsonDecode(value.body);
      var options = {
        'key': result["secretkey"],
        'amount': widget.price * 100, //in the smallest currency sub-unit.
        'name': '${user.firstname} ${user.lastname}',
        'order_id':
            result["razorpayorderid"], // Generate order_id using Orders API
        'description': 'Project ${widget.projectid} Assigned ',
        'timeout': 60, // in seconds
        'prefill': {'email': user.email}
      };

      _BidsDetailsState._razorpay.open(options);
    });
  }
}
