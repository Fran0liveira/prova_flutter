// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_itens.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextItens on _TextItens, Store {
  late final _$_textItensAtom =
      Atom(name: '_TextItens._textItens', context: context);

  @override
  List<TextItem> get _textItens {
    _$_textItensAtom.reportRead();
    return super._textItens;
  }

  @override
  set _textItens(List<TextItem> value) {
    _$_textItensAtom.reportWrite(value, super._textItens, () {
      super._textItens = value;
    });
  }

  late final _$_itemToUpdateAtom =
      Atom(name: '_TextItens._itemToUpdate', context: context);

  @override
  TextItem? get _itemToUpdate {
    _$_itemToUpdateAtom.reportRead();
    return super._itemToUpdate;
  }

  @override
  set _itemToUpdate(TextItem? value) {
    _$_itemToUpdateAtom.reportWrite(value, super._itemToUpdate, () {
      super._itemToUpdate = value;
    });
  }

  late final _$_TextItensActionController =
      ActionController(name: '_TextItens', context: context);

  @override
  dynamic setItemToUpdate({int? indexToUpdate, TextItem? itemToUpdate}) {
    final _$actionInfo = _$_TextItensActionController.startAction(
        name: '_TextItens.setItemToUpdate');
    try {
      return super.setItemToUpdate(
          indexToUpdate: indexToUpdate, itemToUpdate: itemToUpdate);
    } finally {
      _$_TextItensActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOrUpdateItem(String value) {
    final _$actionInfo = _$_TextItensActionController.startAction(
        name: '_TextItens.addOrUpdateItem');
    try {
      return super.addOrUpdateItem(value);
    } finally {
      _$_TextItensActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem(TextItem textItem) {
    final _$actionInfo =
        _$_TextItensActionController.startAction(name: '_TextItens.deleteItem');
    try {
      return super.deleteItem(textItem);
    } finally {
      _$_TextItensActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
