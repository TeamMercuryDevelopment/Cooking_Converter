import 'package:cooking_converter/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/convert.dart';
import '../models/product.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  @observable
  ObservableList<Product> listProduct;

  @observable
  ObservableFuture<List<Product>> asyncJsonProductList;

  @observable
  ObservableList<Convert> listConvert = [
    Convert(
      name: "Gramas",
    ),
    Convert(
      name: "Litros",
    ),
    Convert(
      name: "Colher de chá",
    ),
  ].asObservable();

  @observable
  String selectedItem = '';

  @action
  setSelectedItem(String newItem) => selectedItem = newItem;

  @action
  Future<void> fetchProducts() async {
    asyncJsonProductList = ObservableFuture(ProductRepository().getProducts());
    listProduct = await asyncJsonProductList; 
  }


  @computed
  String get transaction => selectedItem;
}
