import 'dart:convert';

import 'package:http/http.dart' as http;

import '../auth/auth-api.dart' as auth;

class AdvertisementFetcher {
  Future<Map<String, List<String>>> fetchAdvertisements() async {
    print("Fetching Ads");
    Map<String, List<String>> _paths = {};
    try {
      var _response = await http.get("${auth.url}/advertisements.json");
      var _extracteddata = jsonDecode(_response.body) as Map<String, dynamic>;
      Map<String, List<String>> _paths = {};
      _extracteddata.forEach((key, value) {
        List<String> _urls = [];
        List<dynamic> _list = value;
        _list.forEach((url) {
          _urls.add(url);
        });
        _paths.addAll({key: _urls});
      });
      print("Paths are $_paths");
      return _paths;
    } catch (error) {
      print("Error while Fetching Ads");
      throw (error);
    }
  }
}
