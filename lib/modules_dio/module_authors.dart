class Author {
  final int id;
  final String name;
  final DateTime birthDay; // تغيير نوع البيانات إلى DateTime
  final String image;
  final String from;
  final String hisUniversity;
  final String language;
  final String aboutIt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Author({
    required this.id,
    required this.name,
    required this.birthDay, // تغيير نوع البيانات إلى DateTime
    required this.image,
    required this.from,
    required this.hisUniversity,
    required this.language,
    required this.aboutIt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] as int,
      name: json['name'] as String,
      birthDay: DateTime.parse(json['birthDay']), // تحويل النص إلى DateTime
      image: json['image'] as String,
      from: json['country'] as String,
      hisUniversity:
          (json['education'] as String).trim(), // إزالة المسافات الزائدة
      language: json['languish'] as String,
      aboutIt: json['About_author'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class AuthorResponse {
  final List<Author> authors; // تغيير الاسم إلى authors

  AuthorResponse({required this.authors});

  factory AuthorResponse.fromJson(Map<String, dynamic> json) {
    var authorsJson = json['data'] as List; // تغيير المفتاح إلى data
    List<Author> authorsList =
        authorsJson.map((authorJson) => Author.fromJson(authorJson)).toList();
    return AuthorResponse(authors: authorsList);
  }
}
