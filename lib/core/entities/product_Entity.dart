import 'package:ecommerece_fruites/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String categoryCode;

  final String description;
  final num price;
  final bool isFavorite;
  final bool isFeatured;
  final String? imageUrl;

  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;

  final num avgRating;
  final num ratingCount;
  final int unitAmount;

  final List<ReviewEntity> reviews;

  const ProductEntity({
    required this.name,
    required this.code,
    required this.categoryCode,
    required this.description,
    required this.price,
    required this.reviews,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isFavorite = false,
    this.isOrganic = false,
    required this.isFeatured,
    this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
  });

  @override
  List<Object?> get props => [code];
}












class FavoriteModel {
  final String code;
  final String name;
  final String description;
  final String? imageUrl; // <-- ADD THIS

  final num price;
  final int numberOfCalories;

  FavoriteModel({
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl, // <-- ADD THIS

    required this.numberOfCalories,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl, // <-- ADD THIS

      'numberOfCalories': numberOfCalories,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      code: map['code'],
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'], // <-- ADD THIS

      price: map['price'],
      numberOfCalories: map['numberOfCalories'],
    );
  }
}
