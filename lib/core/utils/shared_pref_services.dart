import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  setUserID({required String userID, required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userID);
    prefs.setString("password", password);
    return;
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }

  setUserToken({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("userToken", userToken);
  }

  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userToken");
  }

  Future<bool> setIntroScreenSeen({required bool isSeen}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("isSeen", isSeen);
  }

  getisSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isSeen");
  }

  deleteAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userId");
    prefs.remove("userToken");
    prefs.remove("isSeen");
  }
}
