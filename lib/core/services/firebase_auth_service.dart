import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> deleteUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.delete();
        log("User successfully deleted.");
      } else {
        log("No user found to delete.");
      }
    } catch (e, stackTrace) {
      log("Error deleting user: $e", error: e, stackTrace: stackTrace);
      throw CustomException(message: "فشل حذف المستخدم، يرجى المحاولة مرة أخرى.");
    }
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code} - ${e.message}");
      throw _handleFirebaseAuthException(e);
    } catch (e) {
      log("Unknown Exception: $e");
      throw CustomException(message: "حدث خطأ، يرجى المحاولة لاحقًا.");
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw CustomException(message: "تعذر تسجيل الدخول، حاول مرة أخرى.");
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code} - ${e.message}");
      throw _handleFirebaseAuthException(e);
    } catch (e) {
      log("Unknown Exception: $e");
      throw CustomException(message: "حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.");
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw CustomException(message: "تم إلغاء تسجيل الدخول باستخدام Google.");
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      if (userCredential.user == null) {
        throw CustomException(message: "فشل تسجيل الدخول باستخدام Google.");
      }

      return userCredential.user;
    } catch (e, stackTrace) {
      log("Error in signInWithGoogle: $e", error: e, stackTrace: stackTrace);
      throw CustomException(message: "حدث خطأ أثناء تسجيل الدخول باستخدام Google.");
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);
      final LoginResult loginResult =
      await FacebookAuth.instance.login(nonce: nonce);
      OAuthCredential facebookAuthCredential;

      if (Platform.isIOS) {
        switch (loginResult.accessToken!.type) {
          case AccessTokenType.classic:
            final token = loginResult.accessToken as ClassicToken;
            facebookAuthCredential = FacebookAuthProvider.credential(
              token.authenticationToken!,
            );
            break;
          case AccessTokenType.limited:
            final token = loginResult.accessToken as LimitedToken;
            facebookAuthCredential = OAuthCredential(
              providerId: 'facebook.com',
              signInMethod: 'oauth',
              idToken: token.tokenString,
              rawNonce: rawNonce,
            );
            break;
        }
      } else {
        facebookAuthCredential = FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString,
        );
      }

      final UserCredential userCredential =
      await _auth.signInWithCredential(facebookAuthCredential);

      if (userCredential.user == null) {
        throw CustomException(message: "تعذر تسجيل الدخول باستخدام Facebook.");
      }

      return userCredential.user;
    } catch (e, stackTrace) {
      log("Error in signInWithFacebook: $e", error: e, stackTrace: stackTrace);
      throw CustomException(
          message: "حدث خطأ أثناء تسجيل الدخول باستخدام Facebook.");
    }
  }

  Future<User?> signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(oauthCredential);

      if (userCredential.user == null) {
        throw CustomException(message: "فشل تسجيل الدخول باستخدام Apple.");
      }

      return userCredential.user;
    } catch (e, stackTrace) {
      log("Error in signInWithApple: $e", error: e, stackTrace: stackTrace);
      throw CustomException(
          message: "حدث خطأ أثناء تسجيل الدخول باستخدام Apple.");
    }
  }

  // Utility methods for nonce generation
  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Handles common FirebaseAuth exceptions
  CustomException _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return CustomException(message: "كلمة المرور التي أدخلتها ضعيفة جدًا.");
      case 'email-already-in-use':
        return CustomException(
            message: "الحساب بهذا البريد الإلكتروني موجود بالفعل.");
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return CustomException(
            message: "الرقم السري أو البريد الإلكتروني غير صحيح.");
      case 'network-request-failed':
        return CustomException(
            message: "تعذر الاتصال بالشبكة. يرجى التحقق من اتصالك بالإنترنت.");
      default:
        return CustomException(message: "حدث خطأ، يرجى المحاولة لاحقًا.");
    }
  }

  bool isLoggedIn(){
    return FirebaseAuth.instance.currentUser !=null;


  }











}
