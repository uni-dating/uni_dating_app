import 'package:shared_preferences/shared_preferences.dart';

export 'package:shared_preferences/shared_preferences.dart';

/// Wraps [SharedPreferences] that wraps NSUserDefaults (on iOS)
/// and SharedPreferences (on Android), providing a persistent
/// store for simple data.
///
/// Data is persisted to disk asynchronously.
class PreferenceService {
  /// Gets a singleton instance of [PreferenceService].
  factory PreferenceService() => _singleton;
  PreferenceService._();
  static final PreferenceService _singleton = PreferenceService._();

  /// Initializes [PreferenceService].
  Future<void> init() async {
    final pref = await SharedPreferences.getInstance();
    sharedPref = pref;
  }

  /// Instance of [SharedPreferences].
  late SharedPreferences sharedPref;
}
