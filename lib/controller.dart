import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:patrice_mulindi_task/model/profile.dart';
import 'package:patrice_mulindi_task/network/user_auth.dart';
import 'package:patrice_mulindi_task/utils/liveasy_routes.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.

class Controller extends GetxController {
  final List<String> languages = ['English'];
  final Rx<String> selectedLanguage = Rx('English');

  final UserAuth _auth = UserAuth();

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
  String initialCountry = 'KE';
  final Rx<PhoneNumber> number = Rx(PhoneNumber(isoCode: 'KE'));
  final RxBool isPhoneNumberValid = false.obs;

  late final SystemUiOverlayStyle systemUiOverlayStyle;

  final Rx<ProfileModel> profile = Rx(ProfileModel.none);

  final Rx<String> verificationId = Rx('');
  Rx<int?>? resendToken;

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

  void nextField() {
    ++otpField.value;
    otpField1.value = otpField.value == 1;
    otpField2.value = otpField.value == 2;
    update();
  }

  void navigateToMobileNumber() {
    Get.toNamed(LiveasyRoutes.mobileNumber);
  }

  Future<void> resendCode() async {
    if (resendToken != null) {
      if (resendToken?.value != null) {
        Get.toNamed(LiveasyRoutes.verifyPhone);
        await _auth.signInWithPhoneNumber(
          "+254${mobileNumberController.text}",
          forceResendingToken: resendToken!.value,
          verificationCompleted: (credential) async {
            _auth.signUpUser(credential);
            if (_auth.isUserSignedIn()) {
              navigateToProfile();
            }
          },
          onCodeSent: (String verifiId, int? token) {
            verificationId.value = verifiId;
            resendToken?.value = token;
          },
        );
        if (_auth.isUserSignedIn()) {
          Get.toNamed(LiveasyRoutes.profile);
        }
      }
    } else {
      await openVerificationScreen();
    }
  }

  //If phone supports automatic SMS code resolution.
  // Sign up the user and navigate to profile, else wait for the code input.
  Future<void> openVerificationScreen() async {
    if (isPhoneNumberValid.isTrue) {
      Get.toNamed(LiveasyRoutes.verifyPhone);
      await _auth.signInWithPhoneNumber(
        "+254${mobileNumberController.text}",
        verificationCompleted: (credential) async {
          // Sign the user in  with the auto-generated credential and navigate to profile
          _auth.signUpUser(credential);
          if (_auth.isUserSignedIn()) {
            navigateToProfile();
          }
        },
        onCodeSent: (String verifiId, int? token) {
          verificationId.value = verifiId;
          resendToken?.value = token;
        },
      );
      if (_auth.isUserSignedIn()) {
        Get.toNamed(LiveasyRoutes.profile);
      }
    } else {
      formKey.currentState?.validate();
    }
  }

  void navigateToProfile() {
    String code = otpFieldOne.text +
        otpFieldTwo.text +
        otpFieldThree.text +
        otpFieldFour.text +
        otpFieldFive.text +
        otpFieldSix.text;
    if (code.isNotEmpty && verificationId.value.isNotEmpty) {
      _auth.onCodeSent(verificationId.value, code);
    }
    if (_auth.isUserSignedIn()) {
      Get.toNamed(LiveasyRoutes.profile);
    }
  }
}
