import 'package:cooking_converter/models/measure.dart';
import 'package:cooking_converter/models/product.dart';
import 'package:cooking_converter/utils/network/network_util.dart';
import 'package:mobx/mobx.dart';
part 'conversion_controller.g.dart';

class ConversionController = _ConversionControllerBase
    with _$ConversionController;

abstract class _ConversionControllerBase with Store {
  @observable
  String responseText;


  @observable
  String quantity;

  @action
  setSelectedItem(String newItem) => quantity = newItem;

  @action
  convertIngredient(Product ingredient, String quantity, Measure convertFromValue,
      Measure convertToValue) async {
    var response = await NetWorkUtil().convertMeasures(
        amount: quantity,
        convertFrom: convertFromValue.key,
        convertTo: convertToValue.key,
        ingredient: ingredient.key);

    responseText = '${quantity}' +
        ' ${ingredient.name} de' +
        ' ${convertFromValue.name} equivale ${response["targetAmount"]}' +
        ' ${convertToValue.name}';
  }
}
