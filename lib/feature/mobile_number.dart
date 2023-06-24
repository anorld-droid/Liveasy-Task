import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:patrice_mulindi_task/controller.dart';
import 'package:patrice_mulindi_task/utils/liveasy_strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.
class MobileNumber extends GetView<Controller> {
  const MobileNumber({super.key});

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
          onPressed: SystemNavigator.pop,
          icon: Icon(
            Icons.close,
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
            LiveasyStrings.mobileTitle,
            style: Get.textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 185,
            child: Text(
              LiveasyStrings.mobileSubtitle,
              style: Get.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Form(
          key: controller.formKey,
          child: Container(
            width: Get.width * 0.90,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Get.theme.colorScheme.onBackground, width: 1)),
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                controller.formKey.currentState?.validate();
              },
              onInputValidated: (bool value) {
                controller.isPhoneNumberValid.value = value;
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                trailingSpace: false,
              ),
              validator: (String? number) {
                if (number == null) {
                  return LiveasyStrings.errorMessage;
                } else if (number.length < 11) {
                  return LiveasyStrings.errorMessage;
                } else {
                  return null;
                }
              },
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: Get.textTheme.bodyMedium,
              textStyle: Get.textTheme.bodyMedium,
              initialValue: controller.number,
              maxLength: 11,
              scrollPadding: const EdgeInsets.all(0),
              textFieldController: controller.mobileNumberController,
              formatInput: true,
              countries: ['IN'],
              hintText: LiveasyStrings.hintText,
              spaceBetweenSelectorAndTextField: 0,
              inputDecoration: InputDecoration(
                  prefixIcon: Icon(Icons.remove,
                      color: Get.theme.colorScheme.onSurface, size: 12),
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintStyle: Get.textTheme.bodyMedium,
                  hintText: LiveasyStrings.hintText),
              searchBoxDecoration: InputDecoration(
                labelStyle: Get.textTheme.bodyMedium,
                labelText: 'Search by country name or dial code',
                filled: false,
                fillColor: Get.theme.colorScheme.tertiary,
                hoverColor: Get.theme.colorScheme.tertiary,
                focusColor: Get.theme.colorScheme.tertiary,
                floatingLabelStyle: Get.textTheme.bodyMedium,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              onSaved: (PhoneNumber number) {
                controller.number = number;
              },
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: controller.openVerificationScreen,
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

  Widget _bottomImage() {
    return Image.asset(
      'assets/images/mobile_number_bottom_image.png',
      width: Get.width,
    );
  }
}
