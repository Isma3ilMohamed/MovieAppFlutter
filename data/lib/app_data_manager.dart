import 'data.dart';


class AppDataManager implements DataManager{
  DbHelper _dbHelper;
  ApiHelper _apiHelper;
  PreferenceHelper _preferenceHelper;

  AppDataManager(DbHelper dbHelper,ApiHelper apiHelper,PreferenceHelper preferenceHelper){
    _dbHelper=dbHelper;
    _apiHelper=apiHelper;
    _preferenceHelper=preferenceHelper;
  }


  @override
  bool login(String email, String pass) {
    return _apiHelper.login(email, pass);
  }

}