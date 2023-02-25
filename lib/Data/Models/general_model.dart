class GenralModel {
  dynamic flag;
  String? message;

  GenralModel({this.flag, this.message});

  GenralModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
  }
}
