import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_app/api_key.dart';
import 'package:movie_app/networking/custom_exceptions.dart';

class ApiClient {
  static final queryParameter = {
    "q": 'get:new7:US',
    "p": '1',
    "t": 'ns',
    "st": 'adv'
  };
  var _url =
      Uri.https("unogs-unogs-v1.p.rapidapi.com", "/aaapi.cgi", queryParameter);

  Future<dynamic> get() async {
    var responseJson;
    try {
      final response = await http.get(_url, headers: {
        "x-rapidapi-key": api_key,
        'x-rapidapi-host': 'unogs-unogs-v1.p.rapidapi.com'
      });
      responseJson = _returnResponse(response);
      print(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body.toString();
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
