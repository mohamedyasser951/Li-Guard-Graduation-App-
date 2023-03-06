// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

class Crud {
  static final String basicAuth =
      'Basic ${base64Encode(utf8.encode('Mohamed:3122000'))}';

  static Map<String, String> myheaders = {
    'authorization': basicAuth,
  };

  static Future postRequest(String url, Map data) async {
    try {
      var response =
          await http.post(Uri.parse(url), body: data, headers: myheaders);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        // print(responsebody);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  static Future getReguest(String url) async {
    try {
      var response = await http.get(Uri.parse(url),headers: myheaders);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }
}
