import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {

  // @observable
  // List listProducts = [
  //   "Item 1", "Item 2", "Item 3", "Item 4",
  // ];

  @observable
  String name = '';

  @observable
  String selectedItem = '';

  @action
  setName (String newName) => name = newName;
  
  @action
  setSelectedItem(String newItem) => selectedItem = newItem;

  // @computed
  // List get getListProducts => listProducts;

  @computed
  String get transaction => name;
  
  @computed
  String get selected => selectedItem;
}