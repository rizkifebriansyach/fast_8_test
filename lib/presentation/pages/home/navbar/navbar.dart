import 'package:fast_8_test/presentation/pages/home/home_page.dart';
import 'package:fast_8_test/presentation/pages/home/navbar/navbar_controller.dart';
import 'package:fast_8_test/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Navbar extends StatefulWidget {
  static String routeName="/navbar";
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final controller = Get.find<NavbarController>();
  int pageIndex = 0;

  final pages = [
    HomePage(),
  ];

   @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        maxHeight: MediaQuery.of(context).size.height * 0.4,
        body: pages[0],
        panel: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 4),
                  child: SizedBox(
                    width: 150,
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    navbarItem(
                      title: "Beranda",
                      icon: Icons.home,
                      iconColor: pageIndex == 0 ? primaryColor : Colors.black,
                      onPress: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                    ),
                    navbarItem(
                      title: "Cari",
                      icon: Icons.search,
                      iconColor: pageIndex == 1 ? primaryColor : Colors.black,
                      onPress: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                    ),
                    navbarItem(
                      title: "Keranjang",
                      icon: Icons.shopping_cart_outlined,
                      iconColor: pageIndex == 2 ? primaryColor : Colors.black,
                      onPress: () {
                        setState(() {
                          pageIndex = 2;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    navbarItem(
                      title: "Daftar Transaksi",
                      icon: Icons.list_alt,
                      iconColor: pageIndex == 3 ? primaryColor : Colors.black,
                      onPress: () {
                        setState(
                          () {
                            pageIndex = 3;
                          },
                        );
                      },
                    ),
                    navbarItem(
                      title: "Voucher Saya",
                      icon: Icons.airplane_ticket,
                      iconColor: pageIndex == 4 ? primaryColor : Colors.black,
                      onPress: () {
                        setState(
                          () {
                            pageIndex = 4;
                          },
                        );
                      },
                    ),
                    navbarItem(
                      title: "Alamat Pengiriman",
                      icon: Icons.list_alt,
                      iconColor: pageIndex == 5 ? primaryColor : Colors.black,
                      onPress: () {
                        setState(
                          () {
                            pageIndex = 5;
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    navbarItem(
                      title: "Daftar Teman",
                      icon: Icons.list_alt,
                      iconColor: pageIndex == 6 ? primaryColor : Colors.black,
                      onPress: () {
                        setState(
                          () {
                            pageIndex = 6;
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navbarItem(
      {required String title,
      required IconData icon,
      required Color iconColor,
      required VoidCallback onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 75,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            Flexible(
              child: Text(
                title,
                style: TextStyle(color: iconColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
