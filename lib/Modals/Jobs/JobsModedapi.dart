// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:perhour_flutter/Modals/Jobs/JobsModel.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/api.dart';

class JobsModelapi {
  static Future<List<Jobs>> getDeals() async {
    var res =
        await http.get(Uri.parse("${api}projects/getlatest"), headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Jobs.dealsfromapi(_temp);
  }


  static Future<List<Jobs>> getbycat(String cat) async {
    var res = await http.get(Uri.parse("${api}projects/getbycategory/${cat}"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Jobs.dealsfromapi(_temp);
  }
}
