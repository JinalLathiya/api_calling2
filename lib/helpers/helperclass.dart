import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/details_model_class.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  String API = "https://randomuser.me/api/";

  Future<Details?> fetchData() async {
    Uri URI = Uri.parse(API);

    http.Response response = await http.get(URI);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Details Idata = Details.fromJson(data);
      return Idata;
    } else {
      return null;
    }
  }
}
