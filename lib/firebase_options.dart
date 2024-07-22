// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAX-eWQvl3SRL6eisTuW1IBlELSCgHdDg4',
    appId: '1:1054782589329:web:b3e67a32dbbdeab6e8f230',
    messagingSenderId: '1054782589329',
    projectId: 'ecommerceapp-9a243',
    authDomain: 'ecommerceapp-9a243.firebaseapp.com',
    storageBucket: 'ecommerceapp-9a243.appspot.com',
    measurementId: 'G-R3GX6ZGH17',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0Hkl42uImRvR0RI9eOipELYRjzCb_On4',
    appId: '1:1054782589329:android:e24b02004ee35ebbe8f230',
    messagingSenderId: '1054782589329',
    projectId: 'ecommerceapp-9a243',
    storageBucket: 'ecommerceapp-9a243.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD45U-CVrnvKjnS-NYmH6jb-HDMZqq-ywY',
    appId: '1:1054782589329:ios:6bcc8186a16091c0e8f230',
    messagingSenderId: '1054782589329',
    projectId: 'ecommerceapp-9a243',
    storageBucket: 'ecommerceapp-9a243.appspot.com',
    iosClientId: '1054782589329-vp3u9lhgegldh3tgb0c4dnqet0ims4f9.apps.googleusercontent.com',
    iosBundleId: 'com.app.firestorefront',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD45U-CVrnvKjnS-NYmH6jb-HDMZqq-ywY',
    appId: '1:1054782589329:ios:09825bda1df82bcde8f230',
    messagingSenderId: '1054782589329',
    projectId: 'ecommerceapp-9a243',
    storageBucket: 'ecommerceapp-9a243.appspot.com',
    iosClientId: '1054782589329-076npe3lvtpq899f0fl2leelcsioim74.apps.googleusercontent.com',
    iosBundleId: 'com.example.store',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAX-eWQvl3SRL6eisTuW1IBlELSCgHdDg4',
    appId: '1:1054782589329:web:c07b444b14879574e8f230',
    messagingSenderId: '1054782589329',
    projectId: 'ecommerceapp-9a243',
    authDomain: 'ecommerceapp-9a243.firebaseapp.com',
    storageBucket: 'ecommerceapp-9a243.appspot.com',
    measurementId: 'G-LSEB32NTJE',
  );

}