import 'package:fast_8_test/data/dummy_data.dart';
import 'package:fast_8_test/data/local_db/sqflite_instance.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class NavbarController extends GetxController {
  Database? _database;
  List<Map<String, dynamic>> exploreWellnesList = [];

  Future<void> _initializeDatabase() async {
    _database = await initializedExploreDB();
    // Insert data only once, check if data exists before inserting
    final data = await getExploreData(_database!);
    if (data.isEmpty) {
      await insertData(exploreWellnes, _database!);
    }
    _fetchExploreData();
  }

  Future<void> _fetchExploreData() async {
    final data = await getExploreData(_database!);
    exploreWellnesList = data;
    debugPrint("data : ${exploreWellnesList}");
  }

  Future<void> insertData(
      List<Map<String, dynamic>> explore_wellness, Database db) async {
    for (var data in explore_wellness) {
      await db.insert(
        'explore_wellness',
        {
          'image': data['image'],
          'description': data['description'],
          'amount': data['amount'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Map<String, dynamic>>> getExploreData(Database db) async {
    return await db.query('explore_wellness');
  }

  @override
  void onInit() {
    _initializeDatabase();
    super.onInit();
  }
}
