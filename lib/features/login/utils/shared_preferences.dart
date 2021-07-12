import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPreferences;
  init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  bool get isFirstTimeInApp =>
      _sharedPreferences.getBool(LoginStrings.keyIsFirstTimeInApp) ?? true;

  set isFirstTimeInApp(bool value) {
    _sharedPreferences.setBool(LoginStrings.keyIsFirstTimeInApp, value);
  }

  // Dark Mode
  static const String keyDarkModeSelected = "key_darkMode";
  bool get isDarkModeSelected =>
      _sharedPreferences.getBool(keyDarkModeSelected) ?? false;

  set isDarkModeSelected(bool value) {
    _sharedPreferences.setBool(keyDarkModeSelected, value);
  }

  // Hide Unsuccessful
  static const String keyHideUnsuccessfulApps = "key_hideUnsuccessfulApps";
  bool get shouldHideUnsuccessfulApps =>
      _sharedPreferences.getBool(keyHideUnsuccessfulApps) ?? false;

  set shouldHideUnsuccessfulApps(bool value) {
    _sharedPreferences.setBool(keyHideUnsuccessfulApps, value);
  }

  // Invites Notifications
  static const String keyReceiveInviteNotifications =
      "key_receiveInviteNotifications";
  bool get isReceiveInviteNotifications =>
      _sharedPreferences.getBool(keyReceiveInviteNotifications) ?? false;

  set isReceiveInviteNotifications(bool value) {
    _sharedPreferences.setBool(keyReceiveInviteNotifications, value);
  }

  // Responses Notifications
  static const String keyReceiveResponsesNotifications =
      "key_receiveResponsesNotifications";
  bool get isReceiveResponsesNotifications =>
      _sharedPreferences.getBool(keyReceiveResponsesNotifications) ?? false;

  set isReceiveResponsesNotifications(bool value) {
    _sharedPreferences.setBool(keyReceiveResponsesNotifications, value);
  }
}

final sharedPrefs = SharedPrefs();
