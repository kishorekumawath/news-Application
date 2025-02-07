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
    apiKey: 'AIzaSyBaXR6SzD6hOTlAusmA0lJs4Ia9mjFPs1Y',
    appId: '1:356596466598:web:1ee6c5604153f8efadc567',
    messagingSenderId: '356596466598',
    projectId: 'newsapp-773bc',
    authDomain: 'newsapp-773bc.firebaseapp.com',
    storageBucket: 'newsapp-773bc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrxYdnt8wqthwa3AWb4kAYIfXwoVw0dqw',
    appId: '1:356596466598:android:fa7d7323c1dcfef9adc567',
    messagingSenderId: '356596466598',
    projectId: 'newsapp-773bc',
    storageBucket: 'newsapp-773bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDm15drTHFSkiN8Iyek5yY_53bLcEq3Tjw',
    appId: '1:356596466598:ios:2dd547cc2b74203fadc567',
    messagingSenderId: '356596466598',
    projectId: 'newsapp-773bc',
    storageBucket: 'newsapp-773bc.appspot.com',
    iosBundleId: 'com.example.newsApplication',
  );
}
