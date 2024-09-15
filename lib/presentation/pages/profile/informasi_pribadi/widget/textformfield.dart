import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dropdownButtonCustom(
    {required String label,
    bool? isRequired = false,
    required List<DropdownMenuItem<String>>? items,
    required void Function(String?)? onChanged}) {
  return Column(
    children: [
      Row(
        children: [
          Visibility(
            visible: isRequired ?? true,
            child: Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ),
          Text(label)
        ],
      ),
      DropdownButtonFormField(
        hint: Text(
          "",
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: items,
        onChanged: onChanged,
      ),
       const SizedBox(
          height: 20,
        ),
    ],
  );
}

Widget textFromFieldCustom({
  required String label,
  String? hint,
  final double? width,
   bool? isRequired = false,
  final TextEditingController? controller,
  final TextInputType? keyboardType,
  final int? maxLength,
  final int? maxLines,
  final Color? textColor,
  final Color? hintColor,
  final String? Function(String?)? validator,
  final String? Function(String?)? onChanged,
  final Function()? onTap,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    width: width ?? double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Visibility(
            visible: isRequired ?? true,
            child: Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ),
            Text(
              label,
            ),
            
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        TextFormField(
          onEditingComplete: () => FocusScope.of(Get.context!).nextFocus(),
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: false,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2)),
            hintText: hint,
            floatingLabelStyle: TextStyle(color: textColor),
            labelStyle: TextStyle(color: hintColor ?? Colors.grey),
            hintStyle: TextStyle(color: hintColor ?? Colors.grey),
          ),
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          // validator: (value) => FieldValidator.validate(value!),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
