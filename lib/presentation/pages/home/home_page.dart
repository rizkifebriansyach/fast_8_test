import 'package:fast_8_test/presentation/pages/home/payuung_karyawan/payuung_karyawan.dart';
import 'package:fast_8_test/presentation/pages/home/payuung_pribadi/payung_pribadi.dart';
import 'package:fast_8_test/presentation/pages/profile/profile_page.dart';
import 'package:fast_8_test/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          title: Column(
            children: [
              Text(
                "Selamat Siang",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 28,
            ),
            IconButton(
             icon: Icon( Icons.account_circle,
              size: 48,),
              color: Colors.grey.shade400,
              onPressed: (){
                Get.toNamed(ProfilePage.routeName);
              },
            ),
          ],
        ),
      ),
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(25), left: Radius.circular(25)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TabBar(
                      padding: EdgeInsets.all(4),
                      dividerColor: Colors.white,
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      tabs: [
                        Tab(
                          text: "Payuung Pribadi",
                        ),
                        Tab(
                          text: "Payuung Karyawan",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      PayungPribadi(),
                      PayuungKaryawan(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
