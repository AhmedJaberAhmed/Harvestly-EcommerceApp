import 'package:dartz/dartz.dart';
import 'package:ecommerece_fruites/core/errors/failure.dart';

import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password,String name);

  Future<Either<Failure, UserEntity>> signInUserWithEmailAndPassword(String email, String password);
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signInWithApple();
  Future addUserData({required UserEntity user});
  Future saveUserData({required UserEntity user});
  Future <UserEntity> getUserData({required String uId} );

}
