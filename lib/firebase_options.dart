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
    apiKey: 'AIzaSyDxskMJakQnfhjg9rPTv6AnOMMawd6U89k',
    appId: '1:52541213753:web:8bfc1157b241ce244191e8',
    messagingSenderId: '52541213753',
    projectId: 'inventaris-app23',
    authDomain: 'inventaris-app23.firebaseapp.com',
    databaseURL: 'https://inventaris-app23-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'inventaris-app23.appspot.com',
    measurementId: 'G-1XET3XT9PC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBU2TlOWmp7DozrPTLu8bARi0UmQtPefow',
    appId: '1:52541213753:android:255106242f1baedd4191e8',
    messagingSenderId: '52541213753',
    projectId: 'inventaris-app23',
    databaseURL: 'https://inventaris-app23-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'inventaris-app23.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdY1UFsnwlWI2yVXToYAdKF8YhSdEN7nY',
    appId: '1:52541213753:ios:684ab01fa29c93794191e8',
    messagingSenderId: '52541213753',
    projectId: 'inventaris-app23',
    databaseURL: 'https://inventaris-app23-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'inventaris-app23.appspot.com',
    androidClientId: '52541213753-6f32tn6qr38brk9j50b810ej24r3uihr.apps.googleusercontent.com',
    iosClientId: '52541213753-9u0hutpl5ieqbvk847ecdi56nr0o8iqb.apps.googleusercontent.com',
    iosBundleId: 'com.example.inventarisApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdY1UFsnwlWI2yVXToYAdKF8YhSdEN7nY',
    appId: '1:52541213753:ios:684ab01fa29c93794191e8',
    messagingSenderId: '52541213753',
    projectId: 'inventaris-app23',
    databaseURL: 'https://inventaris-app23-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'inventaris-app23.appspot.com',
    androidClientId: '52541213753-6f32tn6qr38brk9j50b810ej24r3uihr.apps.googleusercontent.com',
    iosClientId: '52541213753-9u0hutpl5ieqbvk847ecdi56nr0o8iqb.apps.googleusercontent.com',
    iosBundleId: 'com.example.inventarisApp',
  );
}
