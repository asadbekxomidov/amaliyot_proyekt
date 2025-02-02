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
    apiKey: 'AIzaSyAXKGSIZQerBmh07XCTQkdZhw2k0IxqYWU',
    appId: '1:315776637831:web:5505bc7c6c3ad0f8fa5122',
    messagingSenderId: '315776637831',
    projectId: 'dars6-b0f9a',
    authDomain: 'dars6-b0f9a.firebaseapp.com',
    databaseURL: 'https://dars6-b0f9a-default-rtdb.firebaseio.com',
    storageBucket: 'dars6-b0f9a.appspot.com',
    measurementId: 'G-H347D8SL9W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgAESglbaU94Z6JI4NImzqCZMuEWIgCdQ',
    appId: '1:315776637831:android:a20477f6ca3bfd63fa5122',
    messagingSenderId: '315776637831',
    projectId: 'dars6-b0f9a',
    databaseURL: 'https://dars6-b0f9a-default-rtdb.firebaseio.com',
    storageBucket: 'dars6-b0f9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlnZKtaBNO-qOsCNB5ISqXZnEunOPpnkg',
    appId: '1:315776637831:ios:0f35eb6b788aa186fa5122',
    messagingSenderId: '315776637831',
    projectId: 'dars6-b0f9a',
    databaseURL: 'https://dars6-b0f9a-default-rtdb.firebaseio.com',
    storageBucket: 'dars6-b0f9a.appspot.com',
    iosBundleId: 'com.example.amaliyotProyekt',
  );
}
