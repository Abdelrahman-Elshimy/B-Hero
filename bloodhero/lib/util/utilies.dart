import 'package:shared_preferences/shared_preferences.dart';
Future<bool> checkSeenStatus() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool seen = pref.getBool('seen');
  if(seen == null) {
    seen = false;
  }
  return seen;
}

void updateStatus() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setBool('seen', true);
}


  Future<String> checkLocalStatus(String localLang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      localLang = prefs.getString('local');
      return localLang;
  }

  




