import 'package:camera/camera.dart';
import 'package:fast_8_test/data/dummy_data.dart';
import 'package:fast_8_test/presentation/pages/profile/informasi_pribadi/informasi_pribadi_controller.dart';
import 'package:fast_8_test/presentation/pages/profile/informasi_pribadi/widget/textformfield.dart';
import 'package:fast_8_test/utils/media_helper.dart';
import 'package:fast_8_test/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InformasiPribadiPage extends StatefulWidget {
  static String routeName = "/informasi-pribadi";
  const InformasiPribadiPage({super.key});

  @override
  State<InformasiPribadiPage> createState() => _InformasiPribadiPageState();
}

class _InformasiPribadiPageState extends State<InformasiPribadiPage> {
  final controller = Get.find<InformasiPribadiController>();

  List<CameraDescription> camerasDescription = [];
  CameraController? cameraController;
  bool? isChecked = false;
  int _currentStep = 0;

  @override
  void initState() {
    // Helper.setupCameraController(cameraController!, camerasDescription);
    super.initState();
  }

  continueStep() async {
    setState(() {
      if (_currentStep < 2) _currentStep = _currentStep + 1;
      if (_currentStep >= 2 && controller.selectedNamaBank != null) {
        controller.initializeDatabase();
        debugPrint("Hit API");
      }
    });
  }

  cancelStep() {
    setState(() {
      if (_currentStep > 0) _currentStep = _currentStep - 1;
    });
  }

  onstepTapped(int value) {
    setState(() {
      _currentStep = value;
    });
  }

  Widget controlsBuilder(context, details) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: details.onStepContinue,
          child: Text("Selanjutnya"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Informasi Pribadi",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Theme(
        data: ThemeData(colorScheme: ColorScheme.light(primary: primaryColor)),
        child: Stepper(
          elevation: 0,
          connectorThickness: 2,
          currentStep: _currentStep,
          onStepContinue: continueStep,
          onStepCancel: cancelStep,
          onStepTapped: onstepTapped,
          type: StepperType.horizontal,
          steps: [
            Step(
                stepStyle: StepStyle(color: primaryColor),
                title: Container(),
                label:
                    Text("Biodata Diri", style: TextStyle(color: primaryColor)),
                isActive: _currentStep >= 0,
                content: step1()),
            Step(
              title: Container(),
              label: Container(
                  height: 50,
                  child: Text("Alamat\nPribadi",
                      style: TextStyle(color: primaryColor))),
              isActive: _currentStep >= 1,
              content: step2(),
            ),
            Step(
              title: Container(),
              label: Text(
                "Informasi\nPerusahaan",
                style: TextStyle(color: primaryColor),
              ),
              isActive: _currentStep >= 2,
              content: step3(),
            ),
          ],
        ),
      ),
    );
  }

  Widget step3() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            textFromFieldCustom(
              label: "Nama Usaha/Perusahaan",
              controller: controller.namaPerusahaanController,
            ),
            textFromFieldCustom(
              label: "Alamat Perusahaan",
              controller: controller.alamatPerusahaanController,
            ),
            dropdownButtonCustom(
              label: "Jabatan",
              items: jabatanData
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                controller.selectedJabatan = item ?? "";
              },
            ),
            dropdownButtonCustom(
              label: "Lama Bekerja",
              items: lamaBekerjaData
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                controller.selectedLamaBekerja = item ?? "";
              },
            ),
            dropdownButtonCustom(
              label: "Sumber Pendapatan",
              items: sumberPendapatanData
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                controller.selectedSumberPendapatan = item ?? "";
                debugPrint(controller.selectedSumberPendapatan);
              },
            ),
            dropdownButtonCustom(
              label: "Pendapatan Kotor Pertahun",
              items: pendaptanKotorData
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                controller.selectedPendapatanKotor = item ?? "";
              },
            ),
            dropdownButtonCustom(
              label: "Nama Bank",
              isRequired: true,
              items: namaBankData
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                controller.selectedNamaBank = item ?? "";
              },
            ),
            textFromFieldCustom(
                label: "Cabang Bank",
                controller: controller.cabangBankController),
            textFromFieldCustom(
                label: "Nomor Rekening",
                keyboardType: TextInputType.number,
                controller: controller.nomorRekeningController),
            textFromFieldCustom(
                label: "Nama Pemilik Rekening",
                controller: controller.namaPemilikRekeningController),
          ],
        ),
      ),
    );
  }

  Widget step2() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(),
                  const SizedBox(
                    height: 15,
                  ),
                  textFromFieldCustom(
                      label: "NIK",
                      isRequired: true,
                      controller: controller.nikController),
                  textFromFieldCustom(
                      label: "Alamat Sesuai KTP",
                      isRequired: true,
                      controller: controller.alamatSesuaiKTPController),
                  dropdownButtonCustom(
                    label: "Provinsi",
                    isRequired: true,
                    items: provinsiData
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      controller.selectedProvinsi = item ?? "";
                    },
                  ),
                  dropdownButtonCustom(
                    label: "Kota/Kabupaten",
                    isRequired: true,
                    items: kotaData
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      controller.selectedKota = item ?? "";
                    },
                  ),
                  dropdownButtonCustom(
                    label: "Kecamatan",
                    isRequired: true,
                    items: kecamatanData
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      controller.selectedKecamatan = item ?? "";
                    },
                  ),
                  dropdownButtonCustom(
                    label: "Kelurahan",
                    isRequired: true,
                    items: kelurahanData
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      controller.selectedKelurahan = item ?? "";
                    },
                  ),
                  textFromFieldCustom(label: "Kode POS", isRequired: true),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        activeColor: primaryColor,
                        onChanged: (newValue) {
                          setState(() {
                            isChecked = newValue;
                          });
                        },
                      ),
                      Text("Alamat domisili sama dengan KTP")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: isChecked == false ?? false,
                    child: Column(
                      children: [
                        textFromFieldCustom(
                            label: "Alamat Sesuai Domisili", isRequired: true),
                        dropdownButtonCustom(
                            label: "Provinsi",
                            isRequired: true,
                            items: provinsiData
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ),
                                )
                                .toList(),
                            onChanged: (item) {}),
                        dropdownButtonCustom(
                            label: "Kota/Kabupaten",
                            isRequired: true,
                            items: kotaData
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ),
                                )
                                .toList(),
                            onChanged: (item) {}),
                        dropdownButtonCustom(
                            label: "Kecamatan",
                            isRequired: true,
                            items: kecamatanData
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ),
                                )
                                .toList(),
                            onChanged: (item) {}),
                        dropdownButtonCustom(
                            label: "Kelurahan",
                            isRequired: true,
                            items: kelurahanData
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ),
                                )
                                .toList(),
                            onChanged: (item) {}),
                        textFromFieldCustom(
                            label: "Kode POS", isRequired: true),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget step1() {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          child: Column(
            children: [
              textFromFieldCustom(
                label: "Nama Lengkap",
                isRequired: true,
                controller: controller.namaLengkapController,
              ),
              textFromFieldCustom(
                controller: controller.tanggalLahirController,
                isRequired: true,
                label: "Tanggal Lahir",
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime(1960),
                          lastDate: DateTime.now())
                      .then(
                    (data) {
                      var formattedDate =
                          DateFormat('dd/MM/yyyy').format(data!);
                      controller.tanggalLahirController.text = formattedDate;
                    },
                  );
                },
              ),
              dropdownButtonCustom(
                label: "Jenis Kelamin",
                isRequired: true,
                items: genderData
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (item) {
                  controller.selectedJenisKelamin = item ?? "";
                },
              ),
              textFromFieldCustom(
                label: "Alamat Email",
                keyboardType: TextInputType.emailAddress,
                isRequired: true,
                controller: controller.alamatEmailController,
              ),
              textFromFieldCustom(
                label: "No HP",
                keyboardType: TextInputType.phone,
                isRequired: true,
                controller: controller.noHpController,
              ),
              dropdownButtonCustom(
                label: "Pendidikan",
                items: pendidikanData
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (item) {
                  controller.selectedPendidikan = item ?? "";
                },
              ),
              dropdownButtonCustom(
                label: "Status Pernikahan",
                items: statusPernikahanData
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (item) {
                  controller.selectedStatusPernikahan = item ?? "";
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
