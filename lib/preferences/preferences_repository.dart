import 'package:prova_flutter/models/text_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  Future<List<TextItem>> getList() async {
    SharedPreferences prefs = await _getPrefs();
    Set<String> keys = prefs.getKeys();

    List<TextItem> values = [];

    for (String key in keys) {
      String? value = prefs.getString(key);
      if (value == null) {
        continue;
      }
      values.add(TextItem(id: key, value: value));
    }

    return values;
  }

  Future<void> putTextItem(TextItem textItem) async {
    SharedPreferences prefs = await _getPrefs();
    await prefs.setString(textItem.id, textItem.value);
  }

  Future<void> deleteText(TextItem textItem) async {
    SharedPreferences prefs = await _getPrefs();
    await prefs.remove(textItem.id);
  }

  Future<SharedPreferences> _getPrefs() {
    return SharedPreferences.getInstance();
  }
}
