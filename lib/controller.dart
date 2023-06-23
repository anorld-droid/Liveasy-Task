import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.

class Controller extends GetxController {
  final List<String> languages = ['English'];
  final Rx<String> selectedLanguage = Rx('English');
  @override
  void onInit() async {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.colorScheme.tertiary,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    ));
  }

  void openBottomSheet() {}
}
