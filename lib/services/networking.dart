import 'dart:convert';
import 'dart:io';

import 'package:flutter_starterpack_jelly/services/storage/storage.dart';
import 'package:flutter_starterpack_jelly/utils/value.dart';
import 'package:http/http.dart' as http;
// GET     /posts
// GET     /posts/1
// POST    /posts
// PUT     /posts/1
// PATCH   /posts/1
// DELETE  /posts/1

class NetworkingHelper {
  String? url;
  NetworkingHelper({this.url});

  Future getToken() async {
    return await SecureStorage().readSecureData(kBearer);
  }

  Future getHeader() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer',
      'x-access-token': '${await getToken()}'
    };
  }

  Future getHeaderMidtrans() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Basic',
      'Authorization':
          'Basic U0ItTWlkLXNlcnZlci1ocWFSYk5iRDlHTHBPdTNtc0lCUlNKMGs6'
    };
  }

  Future getHeaderExcel() async {
    return {
      HttpHeaders.contentTypeHeader:
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      HttpHeaders.authorizationHeader: 'Bearer',
      'x-access-token': '${await getToken()}'
    };
  }

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(
        url.toString(),
      ),
      headers: await getHeader(),
    );
    return _handleResponse(response);
  }

  Future getDataBy2Param(String? param1, String? param2) async {
    http.Response response = await http.get(
      Uri.parse(
        '${url.toString()}/$param1/$param2',
      ),
      headers: await getHeaderExcel(),
    );
    return response;
  }

  Future postData(body) async {
    // create data
    http.Response response = await http.post(
      Uri.parse(
        url.toString(),
      ),
      headers: await getHeader(),
      body: body,
    );
    return _handleResponse(response);
  }

  Future putReplaceOrCreateData(body) async {
    http.Response response = await http.put(
      Uri.parse(
        '$url',
      ),
      headers: await getHeader(),
      body: body,
    );
    return _handleResponse(response);
  }

  Future patchUpdateData(body) async {
    http.Response response = await http.patch(
      Uri.parse(
        '$url',
      ),
      headers: await getHeader(),
      body: body,
    );
    return _handleResponse(response);
  }

  Future deleteData() async {
    http.Response response = await http.delete(
      Uri.parse(
        '$url',
      ),
      headers: await getHeader(),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 400) {
      // print('response : ${response.statusCode}');
      return jsonDecode(response.body);
    } else {
      // print('response : ${response.statusCode}');
      return jsonDecode(response.body);
    }
  }

  // customize
  Future postDataPayment(body) async {
    // create data
    http.Response response = await http.post(
      Uri.parse(
        url.toString(),
      ),
      headers: await getHeaderMidtrans(),
      body: body,
    );
    return _handleResponse(response);
  }
}
