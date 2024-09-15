import 'package:fast_8_test/presentation/pages/profile/informasi_pribadi/informasi_pribadi_controller.dart';
import 'package:get/get.dart';

class InformasiPribadiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> InformasiPribadiController());
  }
  
}