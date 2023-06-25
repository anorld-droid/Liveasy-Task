import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patrice_mulindi_task/controller.dart';
import 'package:patrice_mulindi_task/utils/liveasy_strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.
class VerifyPhone extends GetView<Controller> {
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: controller.systemUiOverlayStyle,
        elevation: 0,
        backgroundColor: Get.theme.colorScheme.background,
        shadowColor: Get.theme.colorScheme.background,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: Get.theme.colorScheme.onSurface,
          ),
          iconSize: 24,
        ),
      ),
      body: SizedBox(width: Get.width, child: _body()),
      bottomNavigationBar: _bottomImage(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LiveasyStrings.verifyTitle,
            style: Get.textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              child: RichText(
                  text: TextSpan(
                      text: LiveasyStrings.verifySubtitle,
                      style: Get.textTheme.bodySmall,
                      children: [
                TextSpan(
                  text: "+254${controller.mobileNumberController.text}",
                  style: Get.textTheme.bodySmall,
                ),
              ]))),
        ),
        Container(
            width: Get.width * 0.90,
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  otpField(controller.otpFieldOne, 1),
                  otpField(controller.otpFieldTwo, 2),
                  otpField(controller.otpFieldThree, 3),
                  otpField(controller.otpFieldFour, 4),
                  otpField(controller.otpFieldFive, 5),
                  otpField(controller.otpFieldSix, 6)
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              text: TextSpan(
                  text: LiveasyStrings.receiveCodeTitle,
                  style: Get.textTheme.bodySmall,
                  children: [
                TextSpan(
                    text: LiveasyStrings.receiveCodeSubtitle,
                    style: Get.textTheme.displayMedium,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await controller.resendCode();
                      }),
              ])),
        ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: controller.navigateToProfile,
          child: Container(
            alignment: Alignment.center,
            width: Get.width * 0.90,
            height: 56,
            color: Get.theme.colorScheme.primary,
            child: Text(
              LiveasyStrings.continueButton,
              style: Get.textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  Widget otpField(TextEditingController editingController, int position) {
    return SizedBox(
        height: 48,
        width: 48,
        child: TextField(
          key: Key(controller.otpField.value.toString()),
          autofocus: controller.otpField.value == position,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: editingController,
          maxLength: 1,
          cursorColor: Get.theme.colorScheme.primary,
          decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              counterText: '',
              hintStyle: Get.textTheme.bodyMedium,
              filled: true,
              fillColor: Get.theme.colorScheme.secondary),
          onChanged: (value) {
            if (value.length == 1) {
              ++controller.otpField.value;
            }
          },
        ));
  }

  Widget _bottomImage() {
    return Image.asset(
      'assets/images/mobile_number_bottom_image.png',
      width: Get.width,
    );
  }
}
