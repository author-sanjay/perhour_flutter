// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:perhour_flutter/Modals/HelpandSupport/TheSupport.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/api.dart';


class TheSupportapi {
  static Future<List<TheSupport>> getDeals() async {
    var res = await http.get(Uri.parse("${api}help/getactive"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return TheSupport.dealsfromapi(_temp);
  }
}