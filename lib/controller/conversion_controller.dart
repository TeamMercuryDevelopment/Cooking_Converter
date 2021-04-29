import 'package:mobx/mobx.dart';
part 'conversion_controller.g.dart';

class ConversionController = _ConversionControllerBase
    with _$ConversionController;

abstract class _ConversionControllerBase with Store {
  @observable
  String selectedItem = '';

  @action
  setSelectedItem(String newItem) => selectedItem = newItem;

  @computed
  String get transaction => selectedItem;
}
