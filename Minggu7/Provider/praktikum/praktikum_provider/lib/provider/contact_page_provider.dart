import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../class_imageItem.dart';

class ContactPageProvider with ChangeNotifier {
  String _nameValue = "";
  String _phoneValue = "";
  XFile? _selectedImage;
  int _selectedIndex = -1;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  final List<Map<String, String>> _contacts = [];
  final List<ImageItem> _imageItems = [];

  String get nameValue => _nameValue;
  String get phoneValue => _phoneValue;
  XFile? get selectedImage => _selectedImage;
  int get selectedIndex => _selectedIndex;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;

  List<Map<String, String>> get contacts => _contacts;
  List<ImageItem> get imageItems => _imageItems;

  void addContact() {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      _contacts.add(
        {
          "title": _nameValue,
          "subtitle": _phoneValue,
          "image": _selectedImage != null ? _selectedImage!.name : "",
        },
      );
      _imageItems.add(ImageItem(_selectedImage!.path));

      _nameValue="";
      _phoneValue="";
      _selectedImage=null;

      _nameController.clear();
      _phoneController.clear();
    }

    notifyListeners();
  }

  void updateContact(int index){
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      contacts[index]["title"] = _nameValue;
      contacts[index]["subtitle"] = _phoneValue;
      contacts[index]["image"] = _selectedImage!.name;
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

set selectedImage(XFile? file) {
  _selectedImage=file;
  notifyListeners(); 
}

set selectedIndex(int index) {
  _selectedIndex=index;
  notifyListeners(); 
}
}
