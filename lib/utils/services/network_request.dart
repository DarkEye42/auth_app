import 'dart:convert';
import 'package:auth_app/features/personalization/models/failure.dart';
import 'package:auth_app/features/personalization/models/response_code.dart';
import 'package:auth_app/features/personalization/models/success.dart';
import 'package:auth_app/utils/constants/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class NetworkRequest {
  static Object? finalResponse;

  static Future<Object> getRequest(
      {required String uri, Map<String, String>? headers}) async {
    try {
      Response response = await get(Uri.parse(uri), headers: headers);
      finalResponse = getResponse(response);
    } catch (exception) {
      if (kDebugMode) {
        debugPrint(exception.toString());
      }
      finalResponse = Failure(600, AppStrings.unknownResponseText);
    }
    return finalResponse!;
  }
  static Future<Object> postRequest(
      {required String uri, Map<String, String>? headers,required Map<String,dynamic> body}) async {
    try {
      Response response = await post(Uri.parse(uri), headers: headers,body: jsonEncode(body));
      finalResponse = getResponse(response);
    } catch (exception) {
      if (kDebugMode) {
        debugPrint(exception.toString());
      }
      finalResponse = Failure(600, AppStrings.unknownResponseText);
    }
    return finalResponse!;
  }
  static Object getResponse(Response response){
    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      return Success(response: jsonData);
    } else{
      return Failure(
          response.statusCode,
          ResponseCode.httpStatusMessages[response.statusCode] ??
              AppStrings.unknownResponseText);
    }
  }
}