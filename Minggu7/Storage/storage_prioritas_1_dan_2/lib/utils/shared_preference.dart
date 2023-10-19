import 'package:shared_preferences/shared_preferences.dart';

String username = "sinta";
String password = "1906";

class SharedPreference {
  Future<void> simpanUsername(String usernameInput) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString(username, usernameInput);
  }

  Future<void> hapusUsername() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.remove(username);
  }

  Future<String> readUsername() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

    return sharedPreference.getString(username) ?? "";
  }

  Future<void> simpanPassword(String passwordInput) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString(password, passwordInput);
  }

  Future<void> hapusPassword() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.remove(password);
  }

  Future<String> readPassword() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

    return sharedPreference.getString(password) ?? "";
  }
}