import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:banker/env.dart';
import 'package:banker/models/home_model.dart';
class HomeApiProvider {
  Client client = Client();
  String url = environment['baseUrl'];
  Future<HomeModel> fetchHome(String _token) async {
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "${_token}"};
    final response = await client.get(url + '/home', headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return HomeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to home get');
    }
  }
}