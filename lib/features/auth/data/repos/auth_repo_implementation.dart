import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerece_fruites/constants.dart';
import 'package:ecommerece_fruites/core/errors/exceptions.dart';
import 'package:ecommerece_fruites/core/errors/failure.dart';
import 'package:ecommerece_fruites/core/services/DatabaseService.dart';
import 'package:ecommerece_fruites/core/services/shared_prefrences_singltone.dart';
import 'package:ecommerece_fruites/core/utils/backend_endpoints.dart';
import 'package:ecommerece_fruites/features/auth/data/models/user_model.dart';
import 'package:ecommerece_fruites/features/auth/domain/entities/user_entity.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImplementation({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user == null) {
        return left(
            ServerFailure("فشل إنشاء المستخدم، يرجى المحاولة مرة أخرى."));
      }

      final userEntity = UserEntity(name: name, email: email, uId: user.uid);

      try {
        await addUserData(user: userEntity);
      } catch (dbError) {
        log("Database error: $dbError. Rolling back user registration.");
        await firebaseAuthService.deleteUser();
        return left(
            ServerFailure("حدث خطأ أثناء حفظ البيانات، تم إلغاء التسجيل."));
      }

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      log(
        "Exception in AuthRepoImplementation.createUserWithEmailAndPassword: $e",
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure("حدث خطأ، يرجى المحاولة مرة أخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(email: email, password: password,);
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      log(
        "Exception in AuthRepoImplementation.signInUserWithEmailAndPassword: $e",
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure("حدث خطأ، يرجى المحاولة مرة أخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();

      if (user == null) {
        return left(ServerFailure("فشل تسجيل الدخول باستخدام Google."));
      }

      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);


      try {
        var isUserExist = await databaseService.checkIFDataExist(
            path: BackendEndPoints.isUserExist, documentId: user.uid);

        if (isUserExist) {
          await getUserData(uId: user.uid);
        } else {
          await addUserData(user: userEntity);
        }
      } catch (dbError) {
        log("Database error: $dbError. Rolling back user registration.");
        await firebaseAuthService.deleteUser();
        return left(
            ServerFailure("حدث خطأ أثناء حفظ البيانات، تم إلغاء التسجيل."));
      }

      return right(userEntity);
    } catch (e, stackTrace) {
      log(
        "Exception in AuthRepoImplementation.signInWithGoogle: $e",
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure("حدث خطأ أثناء تسجيل الدخول باستخدام Google."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthService.signInWithFacebook();

      if (user == null) {
        return left(ServerFailure("فشل تسجيل الدخول باستخدام Facebook."));
      }

      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);


      try {
        var isUserExist = await databaseService.checkIFDataExist(
            path: BackendEndPoints.isUserExist, documentId: user.uid);

        if (isUserExist) {
          await getUserData(uId: user.uid);
        } else {
          await addUserData(user: userEntity);
        }
      } catch (dbError) {
        log("Database error: $dbError. Rolling back user registration.");
        await firebaseAuthService.deleteUser();
        return left(
            ServerFailure("حدث خطأ أثناء حفظ البيانات، تم إلغاء التسجيل."));
      }

      return right(userEntity);
    } catch (e, stackTrace) {
      log(
        "Exception in AuthRepoImplementation.signInWithFacebook: $e",
        error: e,
        stackTrace: stackTrace,
      );
      return left(
          ServerFailure("حدث خطأ أثناء تسجيل الدخول باستخدام Facebook."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      final user = await firebaseAuthService.signInWithApple();

      if (user == null) {
        return left(ServerFailure("فشل تسجيل الدخول باستخدام Apple."));
      }

      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);


      try {
        var isUserExist = await databaseService.checkIFDataExist(
            path: BackendEndPoints.isUserExist, documentId: user.uid);

        if (isUserExist) {
          await getUserData(uId: user.uid);
        } else {
          await addUserData(user: userEntity);
        }
      } catch (dbError) {
        log("Database error: $dbError. Rolling back user registration.");
        await firebaseAuthService.deleteUser();
        return left(
            ServerFailure("حدث خطأ أثناء حفظ البيانات، تم إلغاء التسجيل."));
      }

      return right(userEntity);
    } catch (e, stackTrace) {
      log(
        "Exception in AuthRepoImplementation.signInWithApple: $e",
        error: e,
        stackTrace: stackTrace,
      );
      return left(ServerFailure("حدث خطأ أثناء تسجيل الدخول باستخدام Apple."));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    try {
      await databaseService.addData(
          path: BackendEndPoints.addUserData,
          data: UserModel.fromEntity(user).toMap() ,
          documentId: user.uId);
    } catch (e, stackTrace) {
      log(
        "Error in addUserData: $e",
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerFailure("فشل في حفظ بيانات المستخدم.");
    }
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendEndPoints.getUserData, documentId: uId);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user})async {
//Converting UserEntity to JSON
    var jsonData=jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);

  }

}
