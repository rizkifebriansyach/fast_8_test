import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initializedExploreDB() async {
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, 'my_database.db');

  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE explore_wellness (id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT, description TEXT, amount INTEGER)',
      );
    },
  );
}

Future<Database> initializedUserDB() async {
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, 'user_db.db');

  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, birthDate TEXT, gender TEXT, email TEXT, phoneNumber TEXT, education TEXT, martialStatus TEXT, nik TEXT, address TEXT, province TEXT, kota TEXT, kecamatan TEXT, kelurahan TEXT, postCode TEXT, companyName TEXT, companyAddress TEXT, jobTitle TEXT, lengthOfWork TEXT, income TEXT, incomeGross TEXT, bankName TEXT, bankBranch TEXT, accountNumber TEXT, accountName TEXT)',
      );
    },
  );
}
