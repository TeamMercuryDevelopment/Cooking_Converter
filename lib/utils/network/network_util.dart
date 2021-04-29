import 'dart:convert';

import 'package:cooking_converter/shared/constants/api_key.dart';
import 'package:cooking_converter/shared/constants/default_urls.dart';
import 'package:http/http.dart' as http;

class NetWorkUtil {
  static NetWorkUtil _instance = new NetWorkUtil.internal();
  NetWorkUtil.internal();
  factory NetWorkUtil() => _instance;

  Future<Map> convertMeasures(
      {ingredient, convertFrom, convertTo, amount}) async {
    var apiUrl =
        "$baseUrl/recipes/convert?ingredientName=$ingredient&sourceAmount=$amount&sourceUnit=$convertFrom&targetUnit=$convertTo&apiKey=$apiKey";
    final response = await http.get(Uri.parse(apiUrl));
    Map responseBody = json.decode(response.body);
    return responseBody;
  }
}
