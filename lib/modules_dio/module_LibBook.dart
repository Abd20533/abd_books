// 'library_id',
// 'book_id',
// 'condition_id',
// 'sign',
// 'read_pages'
class LibBook {
  int bookId;
  int userId;
  double rating;
  String body;

  LibBook({
    required this.userId,
    required this.rating,
    required this.bookId,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'book_id': bookId,
      'user_id': userId,
      'rating': rating,
      'body': body
    };
  }

  factory LibBook.fromJson(Map<String, dynamic> json) {
    return LibBook(
      bookId: json['book_id'],
      rating: json['rating'],
      body: json['body'],
      userId: json['user_id'],
    );
  }

  static List<LibBook> listFromJson(List<dynamic> json) {
    return json.map((item) => LibBook.fromJson(item)).toList();
  }
}
