import 'package:fast_8_test/presentation/pages/home/navbar/navbar.dart';
import 'package:fast_8_test/presentation/pages/home/navbar/navbar_binding.dart';
import 'package:get/get.dart';

final navbarRoute = [
  GetPage(
    name: Navbar.routeName,
    page: () => Navbar(),
    binding: NavbarBinding(),
  )
];
