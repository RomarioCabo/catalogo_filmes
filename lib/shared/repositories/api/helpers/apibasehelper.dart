import 'dart:async';
import 'dart:convert';

import 'package:filmcatalog/shared/repositories/api/helpers/apiexception.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  String baseUrl = "https://www.omdbapi.com/";

  Future<dynamic> get({
    required String imdbId,
  }) async {
    return await _request(
      httpMethod: "GET",
      apikey: "e12eb32e",
      imdbId: imdbId,
    );
  }

  Future<dynamic> _request({
    required String httpMethod,
    required String apikey,
    required String imdbId,
  }) async {
    dynamic responseJson;

    var url = "$baseUrl?apikey=$apikey&i=$imdbId";

    try {
      if (kDebugMode) {
        print(url);
      }

      var request = http.Request(httpMethod, Uri.parse(url));

      http.Response response =
          await http.Response.fromStream(await request.send());

      responseJson = _returnResponse(response);

      return responseJson;
    } catch (e) {
      throw Exception(e);
    }
  }

  dynamic _returnResponse(http.Response response) {
    if (kDebugMode) {
      print("${response.statusCode} ${utf8.decode(response.bodyBytes)}");
    }

    switch (response.statusCode) {
      case 200:
        if (response.bodyBytes.isEmpty) {
          return null;
        } else {
          return json.decode(utf8.decode(response.bodyBytes));
        }
      case 400:
        var error = json.decode(utf8.decode(response.bodyBytes));

        throw BadRequestException(
          response.statusCode,
          error["menssagem"],
        );

      case 401:
      case 403:
        var error = json.decode(utf8.decode(response.bodyBytes));

        throw UnauthorisedException(
          response.statusCode,
          error["menssagem"],
        );

      case 500:
      default:
        var error = json.decode(utf8.decode(response.bodyBytes));

        throw FetchDataException(
          response.statusCode,
          error["menssagem"],
        );
    }
  }
}
