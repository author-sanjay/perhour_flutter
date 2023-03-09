// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:perhour_flutter/Modals/Bids/BidsModel.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/api.dart';

class BidModelapi {
  static Future<List<Bids>> getDeals(int projectid) async {
    var res = await http.get(Uri.parse("${api}bids/getprojectbids/$projectid"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Bids.dealsfromapi(_temp);
  }
}
