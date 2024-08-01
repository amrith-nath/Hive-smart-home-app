import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseFirebaseServices {
  Future<User?> createUser(
      {required String userName,
      required String email,
      required String password});
  Future<User?> signIn({required String email, required String password});
  Future<bool> signOut();
}
