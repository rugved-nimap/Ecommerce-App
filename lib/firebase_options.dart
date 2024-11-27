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
    apiKey: 'AIzaSyC_sDFZmst0Ob_7L14a-8QbtKqTv8um91w',
    appId: '1:205518465944:web:37934c8c48f86bc48a59ed',
    messagingSenderId: '205518465944',
    projectId: 'rugved-ecommerce',
    authDomain: 'rugved-ecommerce.firebaseapp.com',
    storageBucket: 'rugved-ecommerce.firebasestorage.app',
    measurementId: 'G-1HMXJBDDYQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvp6ieRsiCYgy2F8Au9oXtL-pO0W06TD0',
    appId: '1:205518465944:android:e22c77e397a9a22a8a59ed',
    messagingSenderId: '205518465944',
    projectId: 'rugved-ecommerce',
    storageBucket: 'rugved-ecommerce.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwvD2F_p6-qVVSxJenzWrlQukvCNrJsVQ',
    appId: '1:205518465944:ios:d5f3c97dfecdd2148a59ed',
    messagingSenderId: '205518465944',
    projectId: 'rugved-ecommerce',
    storageBucket: 'rugved-ecommerce.firebasestorage.app',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwvD2F_p6-qVVSxJenzWrlQukvCNrJsVQ',
    appId: '1:205518465944:ios:d5f3c97dfecdd2148a59ed',
    messagingSenderId: '205518465944',
    projectId: 'rugved-ecommerce',
    storageBucket: 'rugved-ecommerce.firebasestorage.app',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC_sDFZmst0Ob_7L14a-8QbtKqTv8um91w',
    appId: '1:205518465944:web:01ad1fdb9f33f9de8a59ed',
    messagingSenderId: '205518465944',
    projectId: 'rugved-ecommerce',
    authDomain: 'rugved-ecommerce.firebaseapp.com',
    storageBucket: 'rugved-ecommerce.firebasestorage.app',
    measurementId: 'G-KTB8767DFC',
  );
}
