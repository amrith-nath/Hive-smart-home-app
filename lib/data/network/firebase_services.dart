import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../data.dart';
import 'base_firebase_services.dart';

class FirebaseServices implements BaseFirebaseServices {
  final _auth = FirebaseAuth.instance;

  @override
  Future<User?> createUser(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = userCredential.user;
      if (user == null) return null;
      await user.updateProfile(displayName: userName);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        throw NoInternetException("Check your connection");
      } else if (e.code == "email-already-in-use") {
        throw EmailAlreadyInUseException();
      } else if (e.code == "invalid-email") {
        throw UnauthorizedException("$email is not valid");
      } else if (e.code == "user-token-expired" ||
          e.code == "operation-not-allowed") {
        throw InvalidUserException("Token expired");
      } else if (e.code == "weak-password") {
        throw WeakPasswordException();
      } else if (e.code == "too-many-requests") {
        throw EmailAlreadyInUseException(email);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == "network-request-failed") {
        throw NoInternetException("Check your connection");
      } else if (e.code == "email-already-in-use") {
        throw EmailAlreadyInUseException(email);
      } else if (e.code == "invalid-email") {
        throw UnauthorizedException("$email is not valid");
      } else if (e.code == "user-token-expired" ||
          e.code == "operation-not-allowed") {
        throw InvalidUserException("Token Expired");
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS " ||
          e.code == "invalid-credential") {
        throw InvalidUserException("Email and Password doesn't match");
      } else if (e.code == "weak-password") {
        throw WeakPasswordException();
      } else if (e.code == "too-many-requests") {
        throw UnauthorizedException('Too many attempts');
      } else if (e.code == "wrong-password") {
        throw UnauthorizedException('Wrong password');
      } else if (e.code == "user-not-found") {
        throw InvalidUserException('User not found');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
