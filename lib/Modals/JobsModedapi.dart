import 'dart:convert';

import 'package:perhour_flutter/Modals/JobsModel.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/api.dart';

class JobsModelapi {
  static Future<List<Jobs>> getDeals() async {
    var res =
        await http.get(Uri.parse(api + "projects/getlatest"), headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Jobs.dealsfromapi(_temp);
  }
}
