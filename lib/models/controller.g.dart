// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on _ControllerBase, Store {
  Computed<String> _$transactionComputed;

  @override
  String get transaction =>
      (_$transactionComputed ??= Computed<String>(() => super.transaction,
              name: '_ControllerBase.transaction'))
          .value;

  final _$listProductAtom = Atom(name: '_ControllerBase.listProduct');

  @override
  ObservableList<Product> get listProduct {
    _$listProductAtom.reportRead();
    return super.listProduct;
  }

  @override
  set listProduct(ObservableList<Product> value) {
    _$listProductAtom.reportWrite(value, super.listProduct, () {
      super.listProduct = value;
    });
  }

  final _$selectedItemAtom = Atom(name: '_ControllerBase.selectedItem');

  @override
  String get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(String value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  final _$_ControllerBaseActionController =
      ActionController(name: '_ControllerBase');

  @override
  dynamic setSelectedItem(String newItem) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.setSelectedItem');
    try {
      return super.setSelectedItem(newItem);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProduct: ${listProduct},
selectedItem: ${selectedItem},
transaction: ${transaction}
    ''';
  }
}
