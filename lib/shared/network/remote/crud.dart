// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

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
      var response = await http.get(Uri.parse(url), headers: myheaders);
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

  static Future postReguestWithFiels(String url, Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var stream = http.ByteStream(file.openRead());
    var length = await file.length();
    var multiplePartFile = http.MultipartFile("img", stream, length,
        filename: basename(file.path));

    request.files.add(multiplePartFile);
    request.headers.addAll(myheaders);
    request.fields["email"] = data["email"];
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);

    if (myRequest.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print("Error ${myRequest.statusCode}");
    }
  }
}
