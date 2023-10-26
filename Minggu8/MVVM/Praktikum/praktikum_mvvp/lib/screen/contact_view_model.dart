import 'package:flutter/material.dart';
import 'package:praktikum_mvvp/model/contact_model.dart';


class ContactPageProvider with ChangeNotifier {
  String _nameValue = "";
  String _phoneValue = "";
  int _selectedIndex = -1;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  final List<Contact> _contacts = [];

  String get nameValue => _nameValue;
  String get phoneValue => _phoneValue;
  int get selectedIndex => _selectedIndex;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;

  List<Contact> get contacts => _contacts;

  void addContact() {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      _contacts.add(Contact(name: _nameValue, phone: _phoneValue)
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
      _contacts[index]=Contact(name: _nameValue, phone: _phoneValue);
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
}
