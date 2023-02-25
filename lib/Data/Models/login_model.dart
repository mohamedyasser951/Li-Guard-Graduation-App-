class LoginModel {
  dynamic flage;
   String? message;
  String? id;
  LoginModel.fromJson(Map<String, dynamic> json) {
    flage = json["flag"];
    message = json["message"];
    id = json["id"];
  }
}
