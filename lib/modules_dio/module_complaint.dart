class Complaint {
  String body;
  String userId;
//  int id;

  Complaint({
    required this.userId,
    required this.body,
    //  required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      //  'id': id,
      'body': body,
    };
  }

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      body: json['body'],
      //id: json['id'],
      userId: json['user_id'],
    );
  }

  static List<Complaint> listFromJson(List<dynamic> json) {
    return json.map((item) => Complaint.fromJson(item)).toList();
  }
}
