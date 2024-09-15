import 'package:fast_8_test/presentation/pages/home/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class PayungPribadiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> NavbarController());
  }
  
}