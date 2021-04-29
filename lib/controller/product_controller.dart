import 'package:cooking_converter/models/product.dart';
import 'package:cooking_converter/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';
part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  @observable
  ObservableList<Product> listProduct;

  @observable
  ObservableFuture<List<Product>> asyncJsonProductList;

  @action
  Future<void> fetchProducts() async {
    asyncJsonProductList = ObservableFuture(ProductRepository().getProducts());
    listProduct = await asyncJsonProductList;
  }

  @observable
  String selectedItem = '';

  @action
  setSelectedItem(String newItem) => selectedItem = newItem;

  @computed
  String get transaction => selectedItem;
}
