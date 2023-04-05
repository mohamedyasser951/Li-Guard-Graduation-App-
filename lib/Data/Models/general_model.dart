class GenralModel {
  dynamic flag;
  String? message;
  int? inviteCode;

  // GenralModel({this.flag, this.message});

  GenralModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
    inviteCode = json["inviteCode"];
  }
}
