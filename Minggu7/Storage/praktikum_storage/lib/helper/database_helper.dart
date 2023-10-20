import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:storage_prioritas_1_dan_2/model/contact_data_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  String tablename = 'tabelContact';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'contact_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $tablename(
            name TEXT,
            phone TEXT
            )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> addContact(ContactDataModel contactDataModel) async {
    final Database db = await database;
    await db.insert(
      tablename,
      contactDataModel.toMap(),
    );
  }

  Future<List<ContactDataModel>> getContactData() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(tablename);
    return results.map((e) => ContactDataModel.fromMap(e)).toList();
  }

  Future<ContactDataModel> getContactByName(String name) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      tablename,
      where: 'name = ?',
      whereArgs: [name],
    );
    return results.map((e) => ContactDataModel.fromMap(e)).first;
  }

  Future<void> updateContact(ContactDataModel contactDataModel) async {
    final db = await database;
    await db.update(
      tablename,
      contactDataModel.toMap(),
      where: 'name = ?',
      whereArgs: [contactDataModel.name],
    );
  }

  Future<void> deleteContact(String name) async {
    final db = await database;
    await db.delete(
      tablename,
      where: 'name = ?',
      whereArgs: [name],
    );
  }

  Future<void> deleteAllContacts() async {
    final db = await database;
    await db.delete(tablename);
  }
}
