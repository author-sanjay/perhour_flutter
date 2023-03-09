import 'dart:convert';

import 'package:perhour_flutter/Modals/Projects/Posted.dart';
import 'package:http/http.dart' as http;
import 'package:perhour_flutter/Screens/Login/Components/RegisterDetails.dart';
import 'package:perhour_flutter/api.dart';

class Postedapi {
  static Future<List<Posted>> getDeals() async {
    var res = await http.get(Uri.parse(api + "projects/posted${user.id}"),
        headers: headers);
    List _temp = [];
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
    }
    return Posted.dealsfromapi(_temp);
  }
}
