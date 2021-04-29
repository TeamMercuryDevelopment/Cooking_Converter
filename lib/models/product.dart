import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:mobx/mobx.dart';
part 'product.g.dart';

@jsonSerializable
class Product extends _ProductBase with _$Product {
  Product({String key, String id, String name}) : super(key, id, name);

  factory Product.fromMap(Map<String, dynamic> json) {
    try {
      return Product(key: json["key"], id: json["id"], name: json["name"]);
    } catch (e) {
      return null;
    }
  }
}

abstract class _ProductBase with Store {
  _ProductBase(this.key, this.id, this.name);

  @observable
  String name;

  @observable
  String key;

  @observable
  String id;
}
