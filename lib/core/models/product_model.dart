

import '../entities/product_Entity.dart';
import '../helper_functions/getAvgRating.dart';
import 'review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final String categoryCode; // NEW

  final num price;

  final bool isFeatured;
  final num sellingCount;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;
  ProductModel(
      {required this.name,
        required this.code,
        required this.description,
        required this.categoryCode, // NEW

        required this.expirationsMonths,
        required this.numberOfCalories,
        required this.avgRating,
        required this.unitAmount,
        required this.sellingCount,
        required this.reviews,
        required this.price,
        required this.isOrganic,
        required this.isFeatured,
        this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      print("Parsing product: $json");

      return ProductModel(
        name: json['name'] ?? '',
        code: json['code'] ?? '',
        description: json['description'] ?? '',
        expirationsMonths: json['expirationsMonths'] ?? 0,
        numberOfCalories: json['numberOfCalories'] ?? 0,
        categoryCode: json['categoryCode'] ?? '',

        unitAmount: json['unitAmount'] ?? 0,
        sellingCount: json['sellingCount'] ?? 0,
        price: json['price'] ?? 0,
        isOrganic: json['isOrganic'] ?? false,
        isFeatured: json['isFeatured'] ?? false,
        imageUrl: json['imageUrl'],
        reviews: json['reviews'] != null
            ? List<ReviewModel>.from(
            json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : [],
        avgRating: getAvgRating(json['reviews'] != null
            ? List<ReviewModel>.from(
            json['reviews'].map((e) => ReviewModel.fromJson(e)))
            : []),
      );
    } catch (e, stack) {
      print("❌ Error parsing product: $e\n$stack");
      rethrow;
    }
  }


  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      categoryCode: categoryCode,
      description: description,
      price: price,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }


  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'categoryCode': categoryCode,

      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList()
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,

      description: entity.description,
      price: entity.price,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      expirationsMonths: entity.expirationsMonths,
      isOrganic: entity.isOrganic,
      numberOfCalories: entity.numberOfCalories,
      avgRating: entity.avgRating,
      unitAmount: entity.unitAmount,
      sellingCount: 0, // You can adjust this if needed
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(), categoryCode: '',
    );
  }

}