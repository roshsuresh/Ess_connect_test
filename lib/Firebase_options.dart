
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDsHEu-ud92QhkV6KoC1VUZi-EZKSn3PBE',
    appId: '1:448679078277:web:00ac189afe3147174283b4',
    messagingSenderId: '448679078277',
    projectId: 'essconnectapp',
    authDomain: 'essconnectapp.firebaseapp.com',
    storageBucket: 'essconnectapp.appspot.com',
    measurementId: 'G-HVNGJMZVXR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsHEu-ud92QhkV6KoC1VUZi-EZKSn3PBE',
    appId: '1:448679078277:android:b3dbf1fe7a40ee02e93cec',
    messagingSenderId: '448679078277',
    projectId: 'essconnectapp',
    storageBucket: 'essconnectapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl3Xr3J_z7GkeerSZkGLIORVlPKPJpTw8',
    appId: '1:448679078277:ios:ce24e5c1aab7ea76e93cec',
    messagingSenderId: '448679078277',
    projectId: 'essconnectapp',
    storageBucket: 'essconnectapp.appspot.com',
    iosClientId: '448679078277-5h89e9qotinq46dnc4eqesl3a3sps8kr.apps.googleusercontent.com',
    iosBundleId: 'com.gjinfotech.essconnect',
  );
}
