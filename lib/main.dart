import 'package:fast_8_test/presentation/pages/home/home_page.dart';
import 'package:fast_8_test/presentation/pages/home/navbar/navbar.dart';
import 'package:fast_8_test/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const Navbar(),
      initialRoute: Navbar.routeName,
      getPages: AppPages.routes,
    );
  }
}
