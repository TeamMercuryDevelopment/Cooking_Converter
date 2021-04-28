import 'package:mobx/mobx.dart';
part 'product.g.dart';

class Product = _ProductBase with _$Product;

abstract class _ProductBase with Store {
  
 _ProductBase({this.key, this.id, this.name});

  @observable
  String name;

  @observable
  String key;

  @observable
  int id;
}