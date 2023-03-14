// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Modals/Membership/Membership.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';

class Memberapi {
  static Future<List<Member>> getDeals() async {
    var res =
        await http.get(Uri.parse("${api}membership/getall"), headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Member.dealsfromapi(_temp);
  }

  static Future<List<Member>> getsingle() async {
    var res =
    await http.get(Uri.parse("${api}membership/getsingle/${user.membershipid}"), headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Member.dealsfromapi(_temp);
  }
}
