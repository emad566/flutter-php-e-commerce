import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final String _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  _loadThemeFromBox() => _box.read<bool>(_key) ?? false;

  ThemeMode get theme {
    return ThemeMode.system;
    if (_box.read<bool>(_key) == null) return ThemeMode.system;
    return _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  }

  bool switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
    return Get.isDarkMode;
  }
}
