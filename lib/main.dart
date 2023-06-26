import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_demo/config/app_config.dart';
import 'package:bloc_demo/injector/injector.dart';
import 'package:firebase_core/firebase_core.dart';


import 'firestore_app.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppConfig.configDev();
    await Firebase.initializeApp();
    Injector.init();
    await Injector.instance.allReady();

    runApp(const FirestoreApp());
  }, (error, stack) {
    log(error.toString());
  });
}
