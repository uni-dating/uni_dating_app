import 'dart:async';

import 'package:meta/meta.dart';

import 'preference.dart';

/// Defines functionality of `user-level` bool preference setup.
class BoolPreference extends Preference<bool?> {
  /// Constructs an instance of [BoolPreference].
  BoolPreference({
    required String key,
    required bool defaultValue,
  }) : super(key, defaultValue);

  @override
  @protected
  bool? doGetValue(String key) => prefs.getBool(key);

  @override
  @protected
  Future<bool> doSetValue(bool? value) {
    if (value == null) {
      return prefs.remove(key);
    }
    return prefs.setBool(key, value);
  }
}
