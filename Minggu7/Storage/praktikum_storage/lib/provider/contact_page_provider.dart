import 'package:flutter/material.dart';

class ContactPageProvider with ChangeNotifier {
  String _nameValue = "";
  String _phoneValue = "";

  bool _isEdit = false;

  var _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  String get nameValue => _nameValue;
  String get phoneValue => _phoneValue;
  bool get isEdit => _isEdit;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;

  void clear() {
    _nameValue = "";
    _phoneValue = "";
    _nameController.clear();
    _phoneController.clear();
    isEdit = false;
  }

  set nameValue(String val) {
    _nameValue = val;
    notifyListeners();
  }

  set phoneValue(String val) {
    _phoneValue = val;
    notifyListeners();
  }

  set isEdit(bool val) {
    _isEdit = val;
    notifyListeners();
  }

  set nameController(TextEditingController usernameController) {
    _nameController = usernameController;
    notifyListeners();
  }
}
