// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Modals/Projects/Assigned/Assigned.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';

class Assignedapi {
  static Future<List<Asssigned>> getDeals() async {
    var res = await http.post(Uri.parse("${api}projects/assigned/${user.id}"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Asssigned.dealsfromapi(_temp);
  }

  static Future<List<Asssigned>> getall(int id) async {
    var res = await http.get(Uri.parse("${api}users/getcompletedprojects/${id}"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Asssigned.dealsfromapi(_temp);
  }
}
