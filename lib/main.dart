import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patrice_mulindi_task/controller.dart';
import 'package:patrice_mulindi_task/feature/language.dart';
import 'package:patrice_mulindi_task/feature/mobile_number.dart';
import 'package:patrice_mulindi_task/feature/profile.dart';
import 'package:patrice_mulindi_task/feature/verify_phone.dart';
import 'package:patrice_mulindi_task/network/initialize_app.dart';
import 'package:patrice_mulindi_task/utils/liveasy_routes.dart';
import 'package:patrice_mulindi_task/utils/themes.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.
void main() async {
  await AppInit().initializeApp();
  runApp(const LiveasyOTPAuth());
}

class LiveasyOTPAuth extends GetView<Controller> {
  const LiveasyOTPAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<Controller>(() => Controller(), fenix: true);
    return GetMaterialApp(
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
          child: child ?? const SizedBox(),
        );
      },
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      initialRoute: LiveasyRoutes.verifyPhone,
      getPages: [
        GetPage(
          name: LiveasyRoutes.language,
          page: () => const Language(),
        ),
        GetPage(
          name: LiveasyRoutes.mobileNumber,
          page: () => const MobileNumber(),
        ),
        GetPage(
          name: LiveasyRoutes.verifyPhone,
          page: () => const VerifyPhone(),
        ),
        GetPage(
          name: LiveasyRoutes.profile,
          page: () => const Profile(),
        ),
      ],
    );
  }
}
