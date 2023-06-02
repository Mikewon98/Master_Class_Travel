import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:master_travel_app/model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async {
    var apiUri = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUri));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      return <DataModel>[];
    }
  }
}
