import 'package:flutter/material.dart';

class Users extends ChangeNotifier {
  late String? id;
  late String? firstname;
  late String? lastname;
  late String? phonenumber;
  late String? address;
  late String? country;
  late String? email;
  late String? username;
  late String? bankname;
  late String? photo;
  late String? ifsc;
  late String? billingaddress;
  late int? bidsleft;
  late double? stars;

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
