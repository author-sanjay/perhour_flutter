// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';

import 'package:perhour_flutter/Modals/Users/Usertop3.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/api.dart';
class Userapi {
  static Future<List<User3>> getDeals() async {
    var res = await http.get(Uri.parse("${api}users/gettop"),
        headers: headers);
    List _temp = [];
    print(res.body);
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return User3.dealsfromapi(_temp);
  }

  static Future<List<User3>> gettop15() async {
    var res = await http.get(Uri.parse("${api}users/gettop15"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return User3.dealsfromapi(_temp);
  }


  static Future<List<User3>> search(String str) async {
    var res = await http.post(Uri.parse("${api}users/searchfreelancer/${str}"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return User3.dealsfromapi(_temp);
  }
}