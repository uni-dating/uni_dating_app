import 'dart:async';

import 'package:meta/meta.dart';

import 'preference.dart';

/// Defines functionality of `user-level` string preference setup.
class StringPreference extends Preference<String?> {
  /// Constructs an instance of [StringPreference].
  StringPreference({
    required String key,
    required String? defaultValue,
  }) : super(key, defaultValue);

  @override
  @protected
  String? doGetValue(String key) => prefs.getString(key);

  @override
  @protected
  Future<bool> doSetValue(String? value) {
    if (value == null) {
      return prefs.remove(key);
    }
    return prefs.setString(key, value);
  }
}
