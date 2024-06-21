// class UserModel {
//   late String message;
//   late String data;
//
//   UserModel(this.data, this.message);
//
//   UserModel.formJson(Map<String, dynamic> json) {
//     print(json);
//     data = json['status'];
//     message = json['message'];
//   }
// }
//
// class User {
//   late int id;
//   late String name;
//   late String email;
//   late String phone;
//   late String token;
//   String? image;
//
//   User(
//       {required this.name,
//       required this.email,
//       required this.phone,
//       required this.image});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['user']['id'];
//     name = json['user']['username'];
//     phone = json['user']['mobile'];
//     token = json['token'];
//   }
// }
