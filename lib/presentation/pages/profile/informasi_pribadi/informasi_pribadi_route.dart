import 'package:fast_8_test/presentation/pages/profile/informasi_pribadi/informasi_pribadi_binding.dart';
import 'package:fast_8_test/presentation/pages/profile/informasi_pribadi/informasi_pribadi_page.dart';
import 'package:get/get.dart';

final InformasiPribadiRoute = [
  GetPage(
    name: InformasiPribadiPage.routeName,
    page: () => InformasiPribadiPage(),
    binding: InformasiPribadiBinding(),
  )
];
