import 'package:ecommerece_fruites/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

//responsible for mapping
//The main role of UserModel is to convert Firebase's User object into a structured app-specific user model while maintaining clean architecture and separation of concerns.
class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        name: user.displayName ?? "",
        email: user.email ?? "",
        uId: user.uid ?? "");
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'], email: json['email'], uId: json['uId']);
  }

  toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
    );
  }
}
