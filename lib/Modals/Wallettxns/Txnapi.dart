// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:perhour_flutter/Modals/Wallettxns/Txnmodel.dart';
import 'package:http/http.dart'as http;
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';
class Txnapi {
  static Future<List<Txn>> getDeals() async {
    var res = await http.get(Uri.parse("${api}wallet/txns/${user.id}"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Txn.dealsfromapi(_temp);
  }
}