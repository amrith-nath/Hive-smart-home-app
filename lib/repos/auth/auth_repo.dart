import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/repos/auth/i_auth_repo.dart';

import '../../data/data.dart';

class AuthRepo implements IAuthRepo {
  final _service = FirebaseServices();

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String userName}) async {
    return await _service.createUser(
        userName: userName, email: email, password: password);
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _service.signIn(email: email, password: password);
  }

  @override
  Future<bool> signOut() async {
    return _service.signOut();
  }
}
