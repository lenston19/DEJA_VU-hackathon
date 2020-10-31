import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Пароль слабый.');
      } else if (e.code == 'email-already-in-use') {
        print('Аккаунт уже существует.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Такого пользователя не существует.');
      } else if (e.code == 'wrong-password') {
        print('Неверный пароль.');
      }
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
