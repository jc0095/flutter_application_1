import 'dart:convert';

class Category {
  final int categoryId;
  final String categoryName;
  final String categoryState;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryState,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryState: json["category_state"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_state": categoryState,
      };

  Category copy({required String categoryName}) => Category(
        categoryId: categoryId,
        categoryName: categoryName,
        categoryState: categoryState,
      );
}
