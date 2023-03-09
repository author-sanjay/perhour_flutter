// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Users extends ChangeNotifier {
  String id = "";
  String firstname = "";
  String lastname = "";
  String phonenumber = "";
  String address = "";
  String country = "";
  String email = "";
  String username = "";
  String bankname = "";
  String photo = "";
  String ifsc = "";
  String billingaddress = "";
  int bidsleft = 0;
  double stars = 0;

  void signin(
      String id,
      String firstname,
      String lastname,
      String phonenumber,
      String address,
      String country,
      String email,
      String username,
      String bankname,
      String photo,
      String ifsc,
      String billingaddress,
      int bidsleft,
      double stars) {
    id = id;
    firstname = firstname;
    lastname = lastname;
    phonenumber = phonenumber;
    address = address;
    country = country;
    email = email;
    username = username;
    bankname = bankname;
    photo = photo;
    ifsc = ifsc;
    billingaddress = billingaddress;
    bidsleft = bidsleft;
    stars = stars;

    notifyListeners();
  }
}
