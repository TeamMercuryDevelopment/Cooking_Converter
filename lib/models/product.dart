import 'package:mobx/mobx.dart';
part 'product.g.dart';

class Product = _ProductBase with _$Product;

abstract class _ProductBase with Store {
  
 _ProductBase({this.name});

  @observable
  String name;

  @action
  setName(newName) => name = newName;
}