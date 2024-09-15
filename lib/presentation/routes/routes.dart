import 'package:fast_8_test/presentation/pages/home/navbar/navbar_route.dart';
import 'package:fast_8_test/presentation/pages/home/payuung_pribadi/payung_pribadi_route.dart';
import 'package:fast_8_test/presentation/pages/profile/informasi_pribadi/informasi_pribadi_route.dart';
import 'package:fast_8_test/presentation/pages/profile/profile_route.dart';

class AppPages{
  static final routes = [
    ...navbarRoute,
    ...payuungPribadiRoute,
    ...profileRoute,
    ...InformasiPribadiRoute,
  ];
}