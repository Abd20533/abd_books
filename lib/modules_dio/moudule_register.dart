class ModuleRegister {
  late final dynamic name;
  late final dynamic email;
  late final dynamic id;
  late final dynamic token;

  ModuleRegister(
      {required this.name,
      required this.email,
      required this.id,
      required this.token});
  factory ModuleRegister.formJson(dynamic jsonData) {
    return ModuleRegister(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      token: jsonData['token'],
    );
  }
}

class ModuleRegisterField {
  late final String message;
  late final List<String> email;

  ModuleRegisterField({
    required this.email,
    required this.message,
  });

  factory ModuleRegisterField.formJson(dynamic jsonData) {
    return ModuleRegisterField(
      email: jsonData['errors'] != null && jsonData['errors']['email'] != null
          ? jsonData['errors']['email'].cast<String>()
          : [], // إرجاع قائمة فارغة إذا كان email هو null
      message: jsonData['message'],
    );
  }
}
