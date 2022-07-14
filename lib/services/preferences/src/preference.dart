import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../preference.service.dart';

/// Defines base functionality of `user-level` preference setup.
abstract class Preference<T> with ChangeNotifier implements ValueListenable<T> {
  /// Constructs an instance of [Preference].
  Preference(
    this.key,
    this.defaultValue,
  ) : prefs = PreferenceService().sharedPref {
    _valueSubject = BehaviorSubject<T>.seeded(doGetValue(key) ?? defaultValue);
  }

  late BehaviorSubject<T> _valueSubject;

  /// Instance of [SharedPreferences].
  @protected
  final SharedPreferences prefs;

  /// Key of `KeyValue Pair` thst will be stored in [prefs].
  @protected
  final String key;

  /// Default value to that will be used if there is no
  /// data retreived by [key] from [prefs].
  @protected
  final T defaultValue;

  /// Emits current value whenever it changes.
  ValueStream<T> get stream => _valueSubject;

  @override
  T get value => doGetValue(key) ?? defaultValue;

  /// Sets new value of the object. When the value changes,
  /// the callbacks registered with [addListener] will be invoked.
  set value(T value) => setValue(value);

  /// Concrete implementation of `value` getter.
  @protected
  T doGetValue(String key);

  /// Concrete implementation of `value` setter.
  @protected
  Future<bool> doSetValue(T value);

  Future<bool> setValue(T value) async {
    final result = await doSetValue(value);
    if (result == true) {
      _valueSubject.add(value);
      notifyListeners();
    }
    return result;
  }

  /// Removes an entry from persistent storage.
  Future<bool> clear() {
    return prefs.remove(key);
  }

  @override
  void dispose() {
    _valueSubject.close();
    super.dispose();
  }
}
