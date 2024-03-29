class UserDataModel {
  int? flag;
  String? message;
  Data? data;

  UserDataModel({this.flag, this.message, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userPassArd;
  String? userPhone;
  String? userRole;

  Data(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.userPassArd,
      this.userPhone,
      this.userRole});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userPassArd = json['user_pass_ard'];
    userPhone = json['user_phone'];
    userRole = json['user_role'];
  }


}