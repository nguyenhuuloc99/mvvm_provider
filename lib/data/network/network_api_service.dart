import 'dart:convert';
import 'dart:io';

import 'package:mvvm_provider/data/app_exception.dart';
import 'package:mvvm_provider/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetWorkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Exception');
    }
    return jsonResponse;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Exception');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequesException("response ${response.body}");
      case 404:
        throw UnAuthException("response ${response.body}");
      default:
        throw FetchDataException("response ${response.statusCode}");
    }
  }
}
