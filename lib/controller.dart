import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:patrice_mulindi_task/utils/liveasy_routes.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.

class Controller extends GetxController {
  final List<String> languages = ['English'];
  final Rx<String> selectedLanguage = Rx('English');

  final TextEditingController otpFieldOne = TextEditingController();
  final TextEditingController otpFieldTwo = TextEditingController();
  final TextEditingController otpFieldThree = TextEditingController();
  final TextEditingController otpFieldFour = TextEditingController();
  final TextEditingController otpFieldFive = TextEditingController();
  final TextEditingController otpFieldSix = TextEditingController();
  Rx<int> otpField = 1.obs;
  final RxBool otpField1 = true.obs;
  final RxBool otpField2 = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController mobileNumberController = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  final RxBool isPhoneNumberValid = false.obs;

  late final SystemUiOverlayStyle systemUiOverlayStyle;

  @override
  void onInit() async {
    super.onInit();
    systemUiOverlayStyle = SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.colorScheme.tertiary,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  void navigateToMobileNumber() {
    Get.toNamed(LiveasyRoutes.mobileNumber);
  }

  void openVerificationScreen() {
    if (isPhoneNumberValid.isTrue) {
      Get.toNamed(LiveasyRoutes.verifyPhone);
    } else {
      formKey.currentState?.validate();
    }
  }

  void nextField() {
    ++otpField.value;
    otpField1.value = otpField.value == 1;
    otpField2.value = otpField.value == 2;
    update();
  }

  void resendVerificationCode() {}
}
