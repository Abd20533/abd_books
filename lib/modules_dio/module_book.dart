import 'package:culturalspacelibrary/modules_dio/module_Category.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';

class Books {
  ///"id": 6,
  final int? id;
  final String? firstName;
  final String? lastName;
  final int? authorId;
  final int typeId;
  final int? statusId;
  final DateTime datePublication;
  final String? description;
  final String? image;

  ///edite evaluation
  final dynamic evaluation;

  ///final double? price;
  final int? pages;
  final Type? type;
  final Author? author;

  Books({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.authorId,
    required this.typeId,
    required this.statusId,
    required this.datePublication,
    required this.description,
    required this.image,
    required this.evaluation,

    /// required this.price,
    required this.pages,
    required this.type,
    required this.author,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      id: json['id'],
      firstName: json['title'],
      lastName: json['content'],
      authorId: json['author_id'],
      typeId: json['type_id'],
      statusId: json['status_id'],
      datePublication: DateTime.parse(json['date_publication']),
      description: json['description'],
      image: json['image'],

      ///edite evaluation

      evaluation: json['evaluation'] as int,

      /// price: json['price'],
      pages: json['pages'],
      type: Type.fromJson(json['type']),
      author: Author.fromJson(json['author']),
    );
  }
}

class Type {
  final int id;
  final String name;
  final int categoryId;
  final String image;
  final int bonus;

  final Category category;

  Type({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.bonus,
    required this.category,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
      image: json['image'],
      bonus: json['bonus'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
      category: Category.fromJson(json['category']),
    );
  }
}

class BookListResponse {
  final List<Books> books;

  BookListResponse({required this.books});

  factory BookListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      var booksJson = json['data'] as List;
      List<Books> booksList =
          booksJson.map((bookJson) => Books.fromJson(bookJson)).toList();
      return BookListResponse(books: booksList);
    } else {
      print("null");

      return BookListResponse(books: []);
    }
  }
}
