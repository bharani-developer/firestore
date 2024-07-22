import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:store/app.dart';
import 'package:store/data/repostries/authentication/authentication_repository.dart';
import 'package:store/firebase_options.dart';

Future<void> main() async {
  //  widget binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //  Getx local storage
  await GetStorage.init();

  // TODO: Init payment methods

  // Preserve native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) {
      Get.put(AuthenticationRepository());
    },
  );

  // TODO: Initialize authentication

  // TODO: Load all the material design, theme, localization, bindings

  runApp(const App());
}
