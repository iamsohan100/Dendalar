// ignore_for_file: body_might_complete_normally_nullable

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dendalar/core/utils/message/top_message.dart';
import 'package:dendalar/core/utils/network/network_response_model.dart';
import 'package:dendalar/core/utils/share_preference/auth_preference.dart';
import 'package:http/http.dart';

class ApiCaller {
  // get request
  static Future<ResponseModel?> getRequest({required String url}) async {
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${AuthPreference.userToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final decodeResponse = jsonDecode(response.body);

      return ResponseModel(
        statusCode: response.statusCode,
        isSuccess: decodeResponse['success'],
        message: decodeResponse['message'],
        responseData: decodeResponse,
      );
    } on SocketException {
      topMessage(
        title: "No Internert!",
        msg: 'No Internet connection available.',
      );
    } on TimeoutException {
      topMessage(title: "Failed", msg: 'Request timed out. Please try again.');
    }
  }

  // post request
  static Future<ResponseModel?> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Authorization': 'Bearer ${AuthPreference.userToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final decodeResponse = jsonDecode(response.body);
      return ResponseModel(
        statusCode: response.statusCode,
        isSuccess: decodeResponse['success'],
        message: decodeResponse['message'],
        responseData: decodeResponse,
      );
    } on SocketException {
      topMessage(
        title: "No Internert!",
        msg: 'No Internet connection available.',
      );
    } on TimeoutException {
      topMessage(title: "Failed", msg: 'Request timed out. Please try again.');
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
      );

      final decodeResponse = jsonDecode(response.body);

      return ResponseModel(
        statusCode: response.statusCode,
        isSuccess: decodeResponse['success'],
        message: decodeResponse['message'],
        responseData: decodeResponse,
      );
    } on SocketException {
      topMessage(
        title: "No Internert!",
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
      );

      final decodeResponse = jsonDecode(response.body);

      return ResponseModel(
        statusCode: response.statusCode,
        isSuccess: decodeResponse['success'],
        message: decodeResponse['message'],
        responseData: decodeResponse,
      );
    } on SocketException {
      topMessage(
        title: "No Internert!",
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
      );
      final decodeResponse = jsonDecode(response.body);

      return ResponseModel(
        statusCode: response.statusCode,
        isSuccess: decodeResponse['success'],
        message: decodeResponse['message'],
        responseData: decodeResponse,
      );
    } on SocketException {
      topMessage(
        title: "No Internert!",
        msg: 'No Internet connection available.',
      );
    } on TimeoutException {
      topMessage(title: "Failed", msg: 'Request timed out. Please try again.');
    }
  }
}
