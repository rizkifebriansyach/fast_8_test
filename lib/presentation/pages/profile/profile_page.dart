import 'package:fast_8_test/presentation/pages/home/navbar/navbar.dart';
import 'package:fast_8_test/presentation/pages/profile/informasi_pribadi/informasi_pribadi_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.toNamed(Navbar.routeName),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 65,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rizki Febriansyach",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("Masuk dengan Google")
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              menuItem(
                icon: Icons.account_box_outlined,
                title: "Informasi Pribadi",
                onPressed: () {
                  Get.toNamed(InformasiPribadiPage.routeName);
                },
              ),
              menuItem(
                icon: Icons.assignment,
                title: "Syarat & Ketentuan",
                onPressed: () {},
              ),
              menuItem(
                icon: Icons.chat,
                title: "Bantuan",
                onPressed: () {},
              ),
              menuItem(
                icon: Icons.local_police_rounded,
                title: "Kebijakan Privasi",
                onPressed: () {},
              ),
              menuItem(
                icon: Icons.power_settings_new_outlined,
                title: "Log Out",
                onPressed: () {},
              ),
              menuItem(
                icon: Icons.delete_outline_rounded,
                title: "Hapus Akun",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(
      {required IconData icon,
      required String title,
      required VoidCallback onPressed}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(8),
            height: 50,
            decoration: BoxDecoration(),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300),
                  child: Icon(
                    icon,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
