import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:mobx/mobx.dart';
part 'measure.g.dart';

@jsonSerializable
class Measure extends _MeasureBase with _$Measure {
  Measure({String key, String name}) : super(key, name);

  factory Measure.fromMap(Map<String, dynamic> json) {
    try {
      return Measure(key: json["key"], name: json["name"]);
    } catch (e) {
      return null;
    }
  }
}

abstract class _MeasureBase with Store {
  _MeasureBase(this.key, this.name);

  @observable
  String name;

  @observable
  String key;
}
