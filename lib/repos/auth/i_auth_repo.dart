import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepo {
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<User?> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String userName});

  Future<bool> signOut();
}
