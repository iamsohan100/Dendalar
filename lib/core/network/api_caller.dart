// ignore_for_file: body_might_complete_normally_nullable

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:dendalar/core/utils/message/top_message.dart';
import 'package:dendalar/core/utils/network/network_response_model.dart';
import 'package:dendalar/core/utils/share_preference/auth_preference.dart';
import 'package:http/http.dart';

class ApiCaller {


  static ResponseModel _handleResponse(Response response) {
    try {
      final decodeResponse = jsonDecode(response.body);
      return ResponseModel(
        statusCode: response.statusCode,
        isSuccess:
            decodeResponse['success'] ??
            (response.statusCode >= 200 && response.statusCode < 300),
        message: decodeResponse['message'] ?? "Request successful",
        responseData: decodeResponse,
      );
    } catch (e) {
      log("JsonDecode Error: $e");
      log("Response Body: ${response.body}");
      return ResponseModel(
        statusCode: response.statusCode,
        isSuccess: false,
        message:
            "Server returned non-json response (Error ${response.statusCode})",
        responseData: null,
      );
    }
  }

  // get request
  static Future<ResponseModel?> getRequest({required String url}) async {
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${AuthPreference.userToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 15));
      return _handleResponse(response);
    } on SocketException {
      topMessage(
        title: "No Internet!",
        msg: 'No Internet connection available.',
      );
    } on TimeoutException {
      topMessage(title: "Failed", msg: 'Request timed out. Please try again.');
    } catch (e) {
      log("GetRequest Error: $e");
    }
  }

  // post request
  static Future<ResponseModel?> postRequest({
    String? token,
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      log("Post URL: $url");
      log("Post Body: ${jsonEncode(body)}");
      final Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Authorization': 'Bearer ${token ?? AuthPreference.userToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 15));
      return _handleResponse(response);
    } on SocketException {
      topMessage(
        title: "No Internet!",
        msg: 'No Internet connection available.',
      );
    } on TimeoutException {
      topMessage(title: "Failed", msg: 'Request timed out. Please try again.');
    } catch (e) {
      log("PostRequest Error: $e");
    }
  }

  // put request
  static Future<ResponseModel?> putRequest({
    required String url,
    dynamic body,
  }) async {
    try {
      final Response response = await put(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Authorization': 'Bearer ${AuthPreference.userToken}',
          'Content-type': 'application/json',
        },
      ).timeout(const Duration(seconds: 15));
      return _handleResponse(response);
    } on SocketException {
      topMessage(
        title: "No Internet!",
        msg: 'No Internet connection available.',
      );
    } on TimeoutException {
      topMessage(title: "Failed", msg: 'Request timed out. Please try again.');
    }
  }

  // Patch request
  static Future<ResponseModel?> patchRequest({
    required String url,
    dynamic body,
  }) async {
    try {
      final Response response = await patch(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Authorization': 'Bearer ${AuthPreference.userToken}',
          'Content-type': 'application/json',
        },
      ).timeout(const Duration(seconds: 15));
      return _handleResponse(response);
    } on SocketException {
      topMessage(
        title: "No Internet!",
        msg: 'No Internet connection available.',
      );
    } on TimeoutException {
      topMessage(title: "Failed", msg: 'Request timed out. Please try again.');
    }
  }

  // delete request
  static Future<ResponseModel?> deleteRequest({required String url}) async {
    try {
      final Response response = await delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${AuthPreference.userToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 15));
      return _handleResponse(response);
    } on SocketException {
      topMessage(
        title: "No Internet!",
        msg: 'No Internet connection available.',
      );
    } on TimeoutException {
      topMessage(title: "Failed", msg: 'Request timed out. Please try again.');
    }
  }



}
