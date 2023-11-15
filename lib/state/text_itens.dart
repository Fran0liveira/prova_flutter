import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:prova_flutter/models/text_item.dart';
import 'package:prova_flutter/preferences/preferences_repository.dart';
import 'package:uuid/uuid.dart';

part 'text_itens.g.dart';

class TextItens = _TextItens with _$TextItens;

abstract class _TextItens with Store {
  PreferencesRepository _prefs = PreferencesRepository();
  @observable
  List<TextItem> _textItens = [];

  @observable
  TextItem? _itemToUpdate = null;
  int? _indexToUpdate = null;

  List<TextItem> getItens() {
    return _textItens;
  }

  @action
  setItemToUpdate({int? indexToUpdate, TextItem? itemToUpdate}) {
    _itemToUpdate = itemToUpdate;
    _indexToUpdate = indexToUpdate;
  }

  @action
  void addOrUpdateItem(String value) {
    if (_itemToUpdate == null) {
      TextItem textItem = TextItem(id: Uuid().v1(), value: value);
      _textItens.add(textItem);
      _prefs.putTextItem(textItem);
    } else {
      TextItem textItem = TextItem(id: _itemToUpdate!.id, value: value);
      _textItens[_indexToUpdate!] = textItem;
      _prefs.putTextItem(textItem);
    }
  }

  @action
  void deleteItem(TextItem textItem) {
    _textItens.removeWhere((element) => element.id == textItem.id);
    _prefs.deleteText(textItem);
    log('DELETED');
  }

  @action
  fetchItens() async {
    _textItens = await _prefs.getList();
  }
}
