import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPreferences;
  init() async {
    if(_sharedPreferences == null){
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  bool get isFirstTimeInApp => _sharedPreferences.getBool(LoginStrings.keyIsFirstTimeInApp) ?? true;

  set isFirstTimeInApp(bool value) {
    _sharedPreferences.setBool(LoginStrings.keyIsFirstTimeInApp, value);
  }
}

final sharedPrefs = SharedPrefs();