import 'package:flutter/material.dart';

class ContactPageProvider with ChangeNotifier {
  String _nameValue = "";
  String _phoneValue = "";

  var _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  String get nameValue => _nameValue;
  String get phoneValue => _phoneValue;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;

  set nameValue(String val) {
  _nameValue = val;
  notifyListeners(); 
}

set phoneValue(String val) {
  _phoneValue = val;
  notifyListeners(); 
}

set nameController(TextEditingController usernameController){
  _nameController=usernameController;
  notifyListeners();
}
}
