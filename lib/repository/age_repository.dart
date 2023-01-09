import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_interview/model/model_age_response.dart';

import '../app_utils/api_constant.dart';


Future<ModelAgeResponse> ageData(context) async {
  var map = <String, dynamic>{};
  final response = await http.get(Uri.parse(ApiUrls.employeesApiUrl),
  );

  // Show loader
  // showLoadingIndicatorDialog(context);
  if (response.statusCode == 200) {
    // hide loader
    // Get.back();
    var bodyData = jsonDecode(response.body);
    // showToast(bodyData['message'].toString());
    // Navigator.pop(context);
    return ModelAgeResponse.fromJson(jsonDecode(response.body));
  } else {
    // Get.back();
    // var bodyData = jsonDecode(response.body);
    // showToast(bodyData['message'].toString());
    // Navigator.pop(context);
    throw Exception("employeesApiUrl Error${response.body}");
  }
}
