// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Product on _ProductBase, Store {
  final _$nameAtom = Atom(name: '_ProductBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$_ProductBaseActionController = ActionController(name: '_ProductBase');

  @override
  dynamic setName(dynamic newName) {
    final _$actionInfo = _$_ProductBaseActionController.startAction(
        name: '_ProductBase.setName');
    try {
      return super.setName(newName);
    } finally {
      _$_ProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''${name}''';
  }
}
