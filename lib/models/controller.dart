import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  
  @observable
  String name;

  @action
  setName (String newName) => name = newName;

  @action
  String getName () {
    return name;
  } 
    
}