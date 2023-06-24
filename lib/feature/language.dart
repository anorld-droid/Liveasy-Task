import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrice_mulindi_task/controller.dart';
import 'package:patrice_mulindi_task/utils/liveasy_strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.
class Language extends GetView<Controller> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Material(
        color: Get.theme.colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Expanded(flex: 3, child: _body()), _bottomImage()],
        ));
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/language_icon.png',
          width: 90,
          height: 90,
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LiveasyStrings.languageTitle,
            style: Get.textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 185,
            child: Text(
              LiveasyStrings.languageSubtitle,
              style: Get.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Get.theme.colorScheme.onBackground, width: 1)),
          width: 300,
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          padding: const EdgeInsets.all(4.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: controller.selectedLanguage.value,
              iconDisabledColor: Get.theme.colorScheme.onBackground,
              iconEnabledColor: Get.theme.colorScheme.surface,
              focusColor: Get.theme.colorScheme.onBackground,
              elevation: 0,
              style: Get.textTheme.bodyMedium,
              items: controller.languages.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                controller.selectedLanguage.value = newValue ?? '';
              },
              dropdownColor: Get.theme.colorScheme.background,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: controller.navigateToMobileNumber,
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 56,
            color: Get.theme.colorScheme.primary,
            child: Text(
              LiveasyStrings.nextButton,
              style: Get.textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  Widget _bottomImage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          'assets/images/language_bottom.png',
          width: Get.width,
          height: 110,
        ),
        Image.asset(
          'assets/images/language_top.png',
          width: Get.width,
          height: 104,
        )
      ],
    );
  }
}
