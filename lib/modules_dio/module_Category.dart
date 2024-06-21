class Category {
  final int id;
  final String name;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}

class CategoryListResponse {
  final List<Category> categories;

  CategoryListResponse({required this.categories});

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) {
    var categoriesJson = json['data'] as List;
    List<Category> categories = categoriesJson
        .map((categoryJson) => Category.fromJson(categoryJson))
        .toList();
    return CategoryListResponse(categories: categories);
  }
}
// class Category1 {
//   String name;
//   String image;
//   int id;
//
//   Category1({
//     required this.image,
//     required this.name,
//     required this.id,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'image': image,
//       'id': id,
//       'name': name,
//     };
//   }
//
//   factory Category1.fromJson(Map<String, dynamic> json) {
//     return Category1(
//       image: json['image'],
//       id: json['id'],
//       name: json['name'],
//     );
//   }
//
//   static List<Category> listFromJson(List<dynamic> json) {
//     return json.map((item) => Category.fromJson(item)).toList();
//   }
// }
//
// class Category {
//   final dynamic? id;
//   String name;
//   String image;
//
//   Category({
//     required this.image,
//     required this.name,
//     required this.id,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//     print("Books");
//     return Category(
//       image: json['image'],
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }
//
// class CategoriesResponse {
//   final List<Category> categoryList;
//
//   CategoriesResponse({required this.categoryList});
//
//   factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
//     if (json['categories'] !=
//         [
//           [null]
//         ]) {
//       print("not null");
//       var booksJson = json['categories'] as List;
//       List<Category> categoryList =
//           booksJson.map((bookJson) => Category.fromJson(bookJson)).toList();
//       return CategoriesResponse(categoryList: categoryList);
//     } else {
//       print("is null");
//
//       return CategoriesResponse(categoryList: []);
//     }
//   }
// }

///
// class Category {
//   final int id;
//   final String name;
//   final String image;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//
//   Category({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json['id'] as int,
//       name: json['name'] as String,
//       image: json['image'] as String,
//       createdAt: DateTime.parse(json['created_at'] as String),
//       updatedAt: DateTime.parse(json['updated_at'] as String),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       'created_at': createdAt.toIso8601String(),
//       'updated_at': updatedAt.toIso8601String(),
//     };
//   }
// }
//
// class CategoriesResponse {
//   final List<Category> categoryList;
//
//   CategoriesResponse({required this.categoryList});
//
//   factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
//     if (json['categories'] !=
//         [
//           [null]
//         ]) {
//       print("not null");
//       var booksJson = json['categories'];
//       List<Category> categoryList =
//           booksJson.map((bookJson) => Category.fromJson(bookJson)).toList();
//       return CategoriesResponse(categoryList: categoryList);
//     } else {
//       print("is null");
//
//       return CategoriesResponse(categoryList: []);
//     }
//   }
// }
