// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Modals/Projects/Posted/Posted.dart';
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';

class Postedapi {
  static Future<List<Postedd>> getDeals() async {
    var res = await http.post(Uri.parse("${api}projects/getposted/${user.id}"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Postedd.dealsfromapi(_temp);
  }


}
