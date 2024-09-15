import 'package:fast_8_test/data/dummy_data.dart';
import 'package:fast_8_test/data/local_db/sqflite_instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class InformasiPribadiController extends GetxController {
  Database? _database;
  List<Map<String, dynamic>> userData = [];
  final namaLengkapController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final alamatEmailController = TextEditingController();
  final noHpController = TextEditingController();
  final nikController = TextEditingController();
  final alamatSesuaiKTPController = TextEditingController();
  final kodePosController = TextEditingController();
  final namaPerusahaanController = TextEditingController();
  final alamatPerusahaanController = TextEditingController();
  final cabangBankController = TextEditingController();
  final nomorRekeningController = TextEditingController();
  final namaPemilikRekeningController = TextEditingController();

  final step1Key = GlobalKey<FormState>();
  final step2Key = GlobalKey<FormState>();
  final step3Key = GlobalKey<FormState>();

   String? selectedJenisKelamin;
   String? selectedPendidikan;
   String? selectedStatusPernikahan;
   String? selectedProvinsi;
   String? selectedKota;
   String? selectedKecamatan;
   String? selectedKelurahan;
   String? selectedJabatan;
   String? selectedLamaBekerja;
   String? selectedSumberPendapatan;
   String? selectedPendapatanKotor;
   String? selectedNamaBank;

  Future<void> initializeDatabase() async {
    _database = await initializedUserDB();
    // Insert data only once, check if data exists before inserting
    final data = await getUserData(_database!);
    
    await insertData(_database!);

     debugPrint("data : ${data}");
    
    
    
  }

  Future<void> _fetchUserData() async {
    final data = await getUserData(_database!);
    userData = data;
   
  }

  Future<void> insertData(Database db) async {
    await db.insert(
      'users',
      {
        'name': namaLengkapController.text,
        'birthDate': tanggalLahirController.text,
        'gender': selectedJenisKelamin,
        'email': alamatEmailController.text,
        'phoneNumber': noHpController.text,
        'education': selectedPendidikan,
        'martialStatus': selectedStatusPernikahan,
        'nik': nikController.text,
        'address': alamatSesuaiKTPController.text,
        'province': selectedProvinsi,
        'kota': selectedKota,
        'kecamatan': selectedKecamatan,
        'kelurahan': selectedKelurahan,
        'postCode': kodePosController.text,
        'companyName': namaPerusahaanController.text,
        'companyAddress': alamatPerusahaanController.text,
        'jobTitle': selectedJabatan,
        'lengthOfWork': selectedLamaBekerja,
        'income': selectedSumberPendapatan,
        'incomeGross': selectedPendapatanKotor,
        'bankName': selectedNamaBank,
        'bankBranch': cabangBankController.text,
        'accountNumber': nomorRekeningController.text,
        'accountName': namaPemilikRekeningController.text
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getUserData(Database db) async {
    return await db.query('users');
  }

  @override
  void dispose() {
    step1Key.currentState?.dispose();
    step2Key.currentState?.dispose();
    step3Key.currentState?.dispose();
    super.dispose();
  }
}
