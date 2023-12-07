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
    apiKey: 'AIzaSyBI9V9REfNjjE_4exhrcoVp7mhMr3kzhg4',
    appId: '1:106677503857:web:e77b1ed10de0a2e76b58d0',
    messagingSenderId: '106677503857',
    projectId: 'uts-flutix',
    authDomain: 'uts-flutix.firebaseapp.com',
    storageBucket: 'uts-flutix.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzktyXCxsJ5wZyU0pPKU5wH9CRNJbExDg',
    appId: '1:106677503857:android:5adeb151060f03e56b58d0',
    messagingSenderId: '106677503857',
    projectId: 'uts-flutix',
    storageBucket: 'uts-flutix.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCF85ebC48zX4o6ExIftg5xnamAhbyVGwA',
    appId: '1:106677503857:ios:4d8dc359dd6b01e86b58d0',
    messagingSenderId: '106677503857',
    projectId: 'uts-flutix',
    storageBucket: 'uts-flutix.appspot.com',
    iosBundleId: 'com.example.flutixUts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCF85ebC48zX4o6ExIftg5xnamAhbyVGwA',
    appId: '1:106677503857:ios:90266eeca76846fc6b58d0',
    messagingSenderId: '106677503857',
    projectId: 'uts-flutix',
    storageBucket: 'uts-flutix.appspot.com',
    iosBundleId: 'com.example.flutixUts.RunnerTests',
  );
}