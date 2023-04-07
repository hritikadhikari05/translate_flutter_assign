import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_task/controllers/homepage.controller.dart';

class ModalBottomTextField extends StatelessWidget {
  ModalBottomTextField({super.key});
  HomepageController homepageController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: homepageController.searchController,
      decoration: InputDecoration(
        hintText: "Search language",
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 26,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 211, 202, 202)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 211, 202, 202)),
        ),
        enabled: true,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      onChanged: (val) {
        homepageController.searchLanguage(val);
      },
    );
  }
}
