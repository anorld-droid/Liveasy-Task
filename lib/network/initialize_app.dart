import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patrice_mulindi_task/network/firebase_options.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.

class AppInit {
  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
