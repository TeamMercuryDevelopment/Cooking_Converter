import 'package:cooking_converter/models/measure.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

class MeasureRepository {
  Future<List<Measure>> getMeasures() async {
    final response =
        await rootBundle.loadString("assets/database/json/measures.json");
    final serialized = JsonMapper.serialize(response);
    final list = JsonMapper.deserialize<List<Object>>(serialized);
    final measureList = list.map((e) => Measure.fromMap(e)).toList();
    return measureList.asObservable();
  }
}
