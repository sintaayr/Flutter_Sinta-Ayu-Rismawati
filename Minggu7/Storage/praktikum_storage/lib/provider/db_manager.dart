import 'package:flutter/foundation.dart';
import 'package:storage_prioritas_1_dan_2/helper/database_helper.dart';
import 'package:storage_prioritas_1_dan_2/model/contact_data_model.dart';

class DbManager extends ChangeNotifier {

  List<ContactDataModel> _contactDataModel = [];
  List<ContactDataModel> get contactDataModel => _contactDataModel;
  
  late DatabaseHelper _databaseHelper;

  DbManager() {
    _databaseHelper = DatabaseHelper();
    _getAllContact();
  }

  void _getAllContact() async {
    _contactDataModel = await _databaseHelper.getContactData();
    notifyListeners();
  }

  Future<void> addContact(ContactDataModel contactDataModel) async {
    await _databaseHelper.addContact(contactDataModel);
    _getAllContact();
  }

  Future<ContactDataModel> getContactByName(String name) async {
    return await _databaseHelper.getContactByName(name);
  }

  void getContactData() async {
    await _databaseHelper.getContactData();
  }

  void updateContact(ContactDataModel contactDataModel) async {
    await _databaseHelper.updateContact(contactDataModel);
    _getAllContact();
  }

  void deleteContact(String name) async {
    await _databaseHelper.deleteContact(name);
    _getAllContact();
  }

  void deleteAllContact() async {
    await _databaseHelper.deleteAllContacts();
    _getAllContact();
  }
}
