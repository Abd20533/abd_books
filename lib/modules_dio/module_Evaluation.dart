class Evaluation {
  int bookId;
  int userId;
  double rating;
  String body;

  Evaluation({
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

  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      bookId: json['book_id'],
      rating: json['rating'],
      body: json['body'],
      userId: json['user_id'],
    );
  }

  static List<Evaluation> listFromJson(List<dynamic> json) {
    return json.map((item) => Evaluation.fromJson(item)).toList();
  }
}
