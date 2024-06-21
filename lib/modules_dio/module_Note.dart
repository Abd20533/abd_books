class Note {
  int bookId;
  int userId;
  int page;
  String body;

  Note({
    required this.userId,
    required this.page,
    required this.bookId,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {'book_id': bookId, 'user_id': userId, 'page': page, 'body': body};
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      bookId: json['book_id'],
      page: json['page'],
      body: json['body'],
      userId: json['user_id'],
    );
  }

  static List<Note> listFromJson(List<dynamic> json) {
    return json.map((item) => Note.fromJson(item)).toList();
  }
}
