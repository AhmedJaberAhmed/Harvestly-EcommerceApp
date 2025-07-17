 
class CategoryModel {
  final String name;
  final String code;
  final String description;
  final bool isFeatured;
  String? imageUrl;

  CategoryModel({
    required this.name,
    required this.code,
    required this.description,
    required this.isFeatured,
    this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    try {
      print("Parsing category: $json");

      return CategoryModel(
        name: json['name'] ?? '',
        code: json['code'] ?? '',
        description: json['description'] ?? '',
        isFeatured: json['isFeatured'] ?? false,
        imageUrl: json['imageUrl'],
      );
    } catch (e, stack) {
      print("❌ Error parsing category: $e\n$stack");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      name: name,
      code: code,
      description: description,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
    );
  }
}
class CategoryEntity {
  final String name;
  final String code;
  final String description;
  final bool isFeatured;
  final String? imageUrl;

  CategoryEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.isFeatured,
    this.imageUrl,
  });
}
