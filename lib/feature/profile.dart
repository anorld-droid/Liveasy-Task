import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrice_mulindi_task/controller.dart';
import 'package:patrice_mulindi_task/model/profile.dart';
import 'package:patrice_mulindi_task/utils/liveasy_strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.
class Profile extends GetView<Controller> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Material(
      color: Get.theme.colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              LiveasyStrings.languageTitle,
              style: Get.textTheme.bodyLarge,
            ),
          ),
          InkWell(
            onTap: () {
              controller.profile.value = ProfileModel.shipper;
            },
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Get.theme.colorScheme.onBackground, width: 1)),
                width: 330,
                margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Obx(() => Radio<ProfileModel>(
                        value: ProfileModel.shipper,
                        groupValue: controller.profile.value,
                        activeColor: Get.theme.colorScheme.primary,
                        onChanged: (ProfileModel? val) {
                          if (val != null) {
                            controller.profile.value = val;
                          }
                        })),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Image.asset(
                        'assets/images/shipper.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LiveasyStrings.shipper,
                              style: Get.textTheme.labelMedium,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              LiveasyStrings.profileSubtitle,
                              style: Get.textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ))
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              controller.profile.value = ProfileModel.transporter;
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Get.theme.colorScheme.onBackground, width: 1)),
              width: 330,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Obx(() => Radio<ProfileModel>(
                      value: ProfileModel.transporter,
                      groupValue: controller.profile.value,
                      activeColor: Get.theme.colorScheme.primary,
                      onChanged: (ProfileModel? val) {
                        if (val != null) {
                          controller.profile.value = val;
                        }
                      })),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Image.asset(
                      'assets/images/transporter.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LiveasyStrings.transporter,
                            style: Get.textTheme.labelMedium,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            LiveasyStrings.profileSubtitle,
                            style: Get.textTheme.bodySmall,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 330,
              height: 56,
              color: Get.theme.colorScheme.primary,
              child: Text(
                LiveasyStrings.continueButton,
                style: Get.textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
