import 'package:flutter/material.dart';

class ContactPageProvider with ChangeNotifier {
  String _nameValue = "";
  String _phoneValue = "";
  int _selectedIndex = -1;

  var _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  final List<Map<String, String>> _contacts = [];

  String get nameValue => _nameValue;
  String get phoneValue => _phoneValue;
  int get selectedIndex => _selectedIndex;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;

  List<Map<String, String>> get contacts => _contacts;

  void addContact() {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      _contacts.add(
        {
          "title": _nameValue,
          "subtitle": _phoneValue,
        },
      );

      _nameValue="";
      _phoneValue="";

      _nameController.clear();
      _phoneController.clear();
    }

    notifyListeners();
  }

  void updateContact(int index){
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contacts[index]["title"] = _nameValue;
      contacts[index]["subtitle"] = _phoneValue;
      _selectedIndex = -1;
      _nameController.clear();
      _phoneController.clear();

      notifyListeners();
    }
  }

  set nameValue(String val) {
  _nameValue = val;
  notifyListeners(); 
}

set phoneValue(String val) {
  _phoneValue = val;
  notifyListeners(); 
}

set selectedIndex(int index) {
  _selectedIndex=index;
  notifyListeners(); 
}

set nameController(TextEditingController usernameController){
  _nameController=usernameController;
  notifyListeners();
}
}
