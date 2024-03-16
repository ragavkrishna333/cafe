// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBlM-2lmqKwYz_dvIQp6wbO3fbKkg670qA',
    appId: '1:206256362607:web:e41d79643eadb8e3b6a99a',
    messagingSenderId: '206256362607',
    projectId: 'cafeproject-2ccba',
    authDomain: 'cafeproject-2ccba.firebaseapp.com',
    storageBucket: 'cafeproject-2ccba.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBk43wfCjYEfskNC-ezqFAfYdiwHPgWNYI',
    appId: '1:206256362607:android:32975da5d5405248b6a99a',
    messagingSenderId: '206256362607',
    projectId: 'cafeproject-2ccba',
    storageBucket: 'cafeproject-2ccba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWqN1qmTK9BoWWqGntXDOlpzWqN5KVOhA',
    appId: '1:206256362607:ios:90b01c39b939490ab6a99a',
    messagingSenderId: '206256362607',
    projectId: 'cafeproject-2ccba',
    storageBucket: 'cafeproject-2ccba.appspot.com',
    iosBundleId: 'com.example.cafe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWqN1qmTK9BoWWqGntXDOlpzWqN5KVOhA',
    appId: '1:206256362607:ios:94aed657d4c7f8ffb6a99a',
    messagingSenderId: '206256362607',
    projectId: 'cafeproject-2ccba',
    storageBucket: 'cafeproject-2ccba.appspot.com',
    iosBundleId: 'com.example.cafe.RunnerTests',
  );
}