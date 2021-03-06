import 'package:cooking_converter/models/measure.dart';
import 'package:cooking_converter/repositories/measure_repository.dart';
import 'package:mobx/mobx.dart';
part 'convert_from_controller.g.dart';

class ConvertFromController = _ConvertFromControllerBase
    with _$ConvertFromController;

abstract class _ConvertFromControllerBase with Store {
  @observable
  ObservableList<Measure> listMeasure;

  @observable
  ObservableFuture<List<Measure>> asyncJsonMeasureList;

  @action
  Future<void> fetchMeasures() async {
    asyncJsonMeasureList = ObservableFuture(MeasureRepository().getMeasures());
    listMeasure = await asyncJsonMeasureList;
  }

  @observable
  Measure selectedItem = Measure(name: '');

  @action
  setSelectedItem(Measure newItem) => selectedItem = newItem;

  @computed
  Measure get transaction => selectedItem;
}
