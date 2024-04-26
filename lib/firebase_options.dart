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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBFRagcToNwojK9RDoemGK_T9SRg6xCtTs',
    appId: '1:844351703138:web:fa472fc0c2b0ca2579a93b',
    messagingSenderId: '844351703138',
    projectId: 'zainfiance-9fc7c',
    authDomain: 'zainfiance-9fc7c.firebaseapp.com',
    storageBucket: 'zainfiance-9fc7c.appspot.com',
    measurementId: 'G-D51F8XRXVL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWMtBY78DB4c1fMoyyuQrdFrju5nnj4-M',
    appId: '1:844351703138:android:7690155c9e4afb3079a93b',
    messagingSenderId: '844351703138',
    projectId: 'zainfiance-9fc7c',
    storageBucket: 'zainfiance-9fc7c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCtxKNpic2pYaaAYRCqWDEv6Oeot--BKg',
    appId: '1:844351703138:ios:27e4043c6e986da379a93b',
    messagingSenderId: '844351703138',
    projectId: 'zainfiance-9fc7c',
    storageBucket: 'zainfiance-9fc7c.appspot.com',
    iosClientId: '844351703138-99il24doa9a2r64mos5if6cbn0jr8hrp.apps.googleusercontent.com',
    iosBundleId: 'com.example.zainFinance',
  );
}
