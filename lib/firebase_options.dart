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
    apiKey: 'AIzaSyDYtThXivewtldwpGxmDarFRKOKT02bGqk',
    appId: '1:78334952504:web:026aeb63c62a281271d2cd',
    messagingSenderId: '78334952504',
    projectId: 'e-com-d6781',
    authDomain: 'e-com-d6781.firebaseapp.com',
    storageBucket: 'e-com-d6781.appspot.com',
    measurementId: 'G-7658G3E9E2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFxPM_t5hz8gmxXjTQgm_iAd5gUplQoUw',
    appId: '1:78334952504:android:79c62d2d7de4c2b071d2cd',
    messagingSenderId: '78334952504',
    projectId: 'e-com-d6781',
    storageBucket: 'e-com-d6781.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9z1vNx_aI0hdgQ5q81vQibYU2cPJa4TY',
    appId: '1:78334952504:ios:e84de0cdb54d501d71d2cd',
    messagingSenderId: '78334952504',
    projectId: 'e-com-d6781',
    storageBucket: 'e-com-d6781.appspot.com',
    iosBundleId: 'com.example.adminApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9z1vNx_aI0hdgQ5q81vQibYU2cPJa4TY',
    appId: '1:78334952504:ios:e84de0cdb54d501d71d2cd',
    messagingSenderId: '78334952504',
    projectId: 'e-com-d6781',
    storageBucket: 'e-com-d6781.appspot.com',
    iosBundleId: 'com.example.adminApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDYtThXivewtldwpGxmDarFRKOKT02bGqk',
    appId: '1:78334952504:web:1fd9f21e10f8382871d2cd',
    messagingSenderId: '78334952504',
    projectId: 'e-com-d6781',
    authDomain: 'e-com-d6781.firebaseapp.com',
    storageBucket: 'e-com-d6781.appspot.com',
    measurementId: 'G-BNWF46DCY6',
  );
}
