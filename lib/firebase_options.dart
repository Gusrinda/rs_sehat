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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4KBcvty3bsASSr668ZfEIvlvL-unvdlw',
    appId: '1:869112136240:android:6b9da82a5db82cb7cf23f5',
    messagingSenderId: '869112136240',
    projectId: 'blitar-sehat',
    storageBucket: 'blitar-sehat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATAUYcxnDAmpSSeew695HzdhlcVbed5ec',
    appId: '1:869112136240:ios:6a33e63126e0ceadcf23f5',
    messagingSenderId: '869112136240',
    projectId: 'blitar-sehat',
    storageBucket: 'blitar-sehat.appspot.com',
    androidClientId: '869112136240-70r8vjejf7u82k549tlb7iap1f9jbtib.apps.googleusercontent.com',
    iosClientId: '869112136240-17gc8pju46vf667c7d9t6ht2akrquj24.apps.googleusercontent.com',
    iosBundleId: 'com.blitarsehat.pasien',
  );
}
