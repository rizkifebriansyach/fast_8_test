import 'package:fast_8_test/data/dummy_data.dart';
import 'package:fast_8_test/presentation/pages/home/navbar/navbar_controller.dart';
import 'package:fast_8_test/utils/extension.dart';
import 'package:fast_8_test/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PayungPribadi extends StatefulWidget {
  static String routeName = "/payuung-pribadi";
  const PayungPribadi({super.key});

  @override
  State<PayungPribadi> createState() => _PayungPribadiState();
}

class _PayungPribadiState extends State<PayungPribadi> {
  final controller = Get.find<NavbarController>();
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Produk Keuangan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 170,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: produkKeuangan.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (contect, index) {
                return Column(
                  children: [
                    // ignore: deprecated_member_use
                    SvgPicture.asset(
                      produkKeuangan[index]["image"],
                      color: Color(
                        produkKeuangan[index]["color"],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        produkKeuangan[index]["title"],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kategori Pilihan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  children: [
                    Text("Whislist"),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: Text(
                        "0",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 170,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: kategoriPilihan.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (contect, index) {
                return Column(
                  children: [
                    // ignore: deprecated_member_use
                    SvgPicture.asset(
                      kategoriPilihan[index]["image"],
                      color: Color(
                        kategoriPilihan[index]["color"],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        kategoriPilihan[index]["title"],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Wellness",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue,
                    hint: Text(
                      dropdownData[0],
                      style: TextStyle(fontSize: 14),
                    ),
                    items: dropdownData.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (v) {
                      setState(
                        () {
                          selectedValue = v;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 100),
              child: GridView.builder(
              physics: ScrollPhysics(),
              itemCount: controller.exploreWellnesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 3,
                childAspectRatio: 1,
              ),
              itemBuilder: (contect, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: deprecated_member_use
                    Container(
                      height: 100,
                      child: Image.asset(
                        controller.exploreWellnesList[index]["image"],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        controller.exploreWellnesList[index]["description"],
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text("".toIDR(amount: controller.exploreWellnesList[index]["amount"]))
                  ],
                );
              },
            ),
            ),
          )
        ],
      ),
    );
  }
}
