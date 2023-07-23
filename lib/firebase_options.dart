
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyAl7iTomh5gf98zCzYIlX2A5lgp6Ni2Lk8',
    appId: '1:453090334216:web:aa00d87f19f407fdec23bd',
    messagingSenderId: '453090334216',
    projectId: 'flutterprojecttest-52acf',
    authDomain: 'flutterprojecttest-52acf.firebaseapp.com',
    storageBucket: 'flutterprojecttest-52acf.appspot.com',
    measurementId: 'G-CFPCP9LNN8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDylllehD1kGKQwNcBK35M7-xFNg0tYnyg',
    appId: '1:453090334216:android:d9d69c73823a85a4ec23bd',
    messagingSenderId: '453090334216',
    projectId: 'flutterprojecttest-52acf',
    storageBucket: 'flutterprojecttest-52acf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDw6WWYJrEYIRxhJUUVA0vgJEAPIdhUTA4',
    appId: '1:453090334216:ios:f7be3885014f28c0ec23bd',
    messagingSenderId: '453090334216',
    projectId: 'flutterprojecttest-52acf',
    storageBucket: 'flutterprojecttest-52acf.appspot.com',
    iosClientId: '453090334216-opm6tdkgav4vvghbb4p7mm1hak5bhv6g.apps.googleusercontent.com',
    iosBundleId: 'com.example.assignment5',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDw6WWYJrEYIRxhJUUVA0vgJEAPIdhUTA4',
    appId: '1:453090334216:ios:c8977eb4bb940af2ec23bd',
    messagingSenderId: '453090334216',
    projectId: 'flutterprojecttest-52acf',
    storageBucket: 'flutterprojecttest-52acf.appspot.com',
    iosClientId: '453090334216-04u10jndup0cbjeon11re2alto3l23f2.apps.googleusercontent.com',
    iosBundleId: 'com.example.assignment5.RunnerTests',
  );
}
