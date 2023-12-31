import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    // if (kIsWeb) {
    //   // Web
    //   return const FirebaseOptions(
    //     apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
    //     authDomain: 'react-native-firebase-testing.firebaseapp.com',
    //     databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    //     projectId: 'react-native-firebase-testing',
    //     storageBucket: 'react-native-firebase-testing.appspot.com',
    //     messagingSenderId: '448618578101',
    //     appId: '1:448618578101:web:772d484dc9eb15e9ac3efc',
    //     measurementId: 'G-0N1G9FLDZE',
    //   );
    // } else if (Platform.isIOS || Platform.isMacOS) {
    //   // iOS and MacOS
    //   return const FirebaseOptions(
    //     appId: '1:448618578101:ios:2bc5c1fe2ec336f8ac3efc',
    //     apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
    //     projectId: 'react-native-firebase-testing',
    //     messagingSenderId: '448618578101',
    //     iosBundleId: 'io.flutter.plugins.firebase.firestore.example',
    //     iosClientId:
    //         '448618578101-ja1be10uicsa2dvss16gh4hkqks0vq61.apps.googleusercontent.com',
    //     androidClientId:
    //         '448618578101-2baveavh8bvs2famsa5r8t77fe1nrcn6.apps.googleusercontent.com',
    //     storageBucket: 'react-native-firebase-testing.appspot.com',
    //     databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    //   );
    // } else {
      // Android
      return const FirebaseOptions(
        appId: '1:235056887436:android:c7310f2ca219e2a94e2da9',
        apiKey: 'AIzaSyCeE9EtgeXQzSGVK8VFno6Haeo9jAEfp9U',
        projectId: 'motatawera-f2ce1',
        androidClientId: '235056887436-q5ioiartvmvttusoeku3jfkdm8i7ma68.apps.googleusercontent.com',
        messagingSenderId: '235056887436',
        authDomain: 'motatawera-f2ce1.firebaseapp.com'
      );
    }
  }
