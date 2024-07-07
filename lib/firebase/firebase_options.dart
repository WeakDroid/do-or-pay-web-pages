import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'AIzaSyDHgecLxfK9m349FLbYy17lPeiVWY3-f1w',
      appId: '1:851846670129:web:562c96103af37839cdf210',
      messagingSenderId: '851846670129',
      projectId: 'doorpay-todo',
      authDomain: 'doorpay-todo.firebaseapp.com',
      storageBucket: 'doorpay-todo.appspot.com',
      measurementId: 'G-1XF7X234YM',
    );
  }
}
