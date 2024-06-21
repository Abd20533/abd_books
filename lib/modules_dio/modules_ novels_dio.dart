class Novels {
  int id;
  String name;
  String image;
  int categoryId;
  int bonus;

  Novels({
    required this.id,
    required this.name,
    required this.bonus,
    required this.categoryId,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'categoryId': categoryId,
      'bonus': bonus,
    };
  }

  factory Novels.fromJson(Map<String, dynamic> json) {
    return Novels(
      bonus: json['bonus'],
      categoryId: json['category_id'],
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class NovelsListResponse {
  final List<Novels> novels;

  NovelsListResponse({required this.novels});

  factory NovelsListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      var booksJson = json['data'] as List;
      List<Novels> booksList =
          booksJson.map((bookJson) => Novels.fromJson(bookJson)).toList();
      return NovelsListResponse(novels: booksList);
    } else {
      print("null");

      return NovelsListResponse(novels: []);
    }
  }
}
