import 'dart:convert';
import 'package:ecommerece_fruites/core/services/shared_prefrences_singltone.dart';
import 'package:ecommerece_fruites/features/auth/data/models/user_model.dart';
import 'package:ecommerece_fruites/features/auth/domain/entities/user_entity.dart';
import '../../constants.dart';

UserEntity getUser(){
  var jsonString=Prefs.getString(kUserData);
  var userEntity=UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}