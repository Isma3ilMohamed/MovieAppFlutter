import 'package:data/pref/preference_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppPreferenceHelper implements PreferenceHelper {

  FlutterSecureStorage _secureStorage;

  AppPreferenceHelper(FlutterSecureStorage secureStorage){
    _secureStorage=secureStorage;
  }



}
