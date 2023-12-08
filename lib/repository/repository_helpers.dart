import 'dart:convert';

import 'package:http/http.dart';
import 'package:onspace_assessment/utils/urls.dart';

Future<dynamic> getRequest({
  required String endpoint,
}) async {
  try {
    Response response = await get(
      Uri.parse(basicUrl + endpoint),
    );
    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      return {
        'data': responseData,
        "status": response.statusCode,
      };
    } else {
      return {
        'data': responseData,
        "status": response.statusCode,
      };
    }
  } catch (e) {
    return {"reason": "Error $e"};
  }
}
