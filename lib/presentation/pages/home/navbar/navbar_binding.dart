import 'package:fast_8_test/presentation/pages/home/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class NavbarBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> NavbarController());
  }
}