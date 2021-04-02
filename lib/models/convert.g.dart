// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Convert on _ConvertBase, Store {
  final _$nameAtom = Atom(name: '_ConvertBase.name');

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

  final _$_ConvertBaseActionController = ActionController(name: '_ConvertBase');

  @override
  dynamic setName(dynamic newName) {
    final _$actionInfo = _$_ConvertBaseActionController.startAction(
        name: '_ConvertBase.setName');
    try {
      return super.setName(newName);
    } finally {
      _$_ConvertBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''${name}''';
  }
}
