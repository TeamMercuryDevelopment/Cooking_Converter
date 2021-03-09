import 'package:mobx/mobx.dart';

import '../product.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {

  @observable
  ObservableList<Product> listProduct = [
    Product(name: "Item 1",),
    Product(name: "Item 2",),
    Product(name: "Item 3",),
  ].asObservable();

  @observable
  String selectedItem = '';

  @action
  setSelectedItem(String newItem) => selectedItem = newItem;

  @computed
  String get transaction => selectedItem;
}