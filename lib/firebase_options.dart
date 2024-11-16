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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCW6omuoSIAfIXpyOFxKJiL28CGE1xGLbk',
    appId: '1:1017836731297:web:e96d0d5d16103b49a8e9e0',
    messagingSenderId: '1017836731297',
    projectId: 'chatear-bdfa4',
    authDomain: 'chatear-bdfa4.firebaseapp.com',
    databaseURL: 'https://chatear-bdfa4-default-rtdb.firebaseio.com',
    storageBucket: 'chatear-bdfa4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB74OJTn9hRrBMZ_Mh7wdnuaap91yID-rI',
    appId: '1:1017836731297:android:e5bad00712afe0dda8e9e0',
    messagingSenderId: '1017836731297',
    projectId: 'chatear-bdfa4',
    databaseURL: 'https://chatear-bdfa4-default-rtdb.firebaseio.com',
    storageBucket: 'chatear-bdfa4.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCW6omuoSIAfIXpyOFxKJiL28CGE1xGLbk',
    appId: '1:1017836731297:web:0715afbfd645c9c3a8e9e0',
    messagingSenderId: '1017836731297',
    projectId: 'chatear-bdfa4',
    authDomain: 'chatear-bdfa4.firebaseapp.com',
    databaseURL: 'https://chatear-bdfa4-default-rtdb.firebaseio.com',
    storageBucket: 'chatear-bdfa4.appspot.com',
  );

}