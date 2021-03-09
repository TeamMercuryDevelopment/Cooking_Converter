import 'package:mobx/mobx.dart';
part 'convert.g.dart';

class Convert = _ConvertBase with _$Convert;

abstract class _ConvertBase with Store {
  
  _ConvertBase({this.name});

  @observable
  String name;

  @action
  setName(newName) => name = newName;
}