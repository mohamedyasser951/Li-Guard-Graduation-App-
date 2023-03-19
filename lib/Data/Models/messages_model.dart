class MessageModel {
  int? flag;
  String? message;
  List<MessageData> data = [];

  MessageModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(MessageData.fromJson(v));
      });
    }
  }
}

class MessageData {
  String? mesId;
  String? mesContent;
  String? mesFrom;
  String? mesTo;

  MessageData({this.mesId, this.mesContent, this.mesFrom, this.mesTo});

  MessageData.fromJson(Map<String, dynamic> json) {
    mesId = json['mes_id'];
    mesContent = json['mes_content'];
    mesFrom = json['mes_from'];
    mesTo = json['mes_to'];
  }
}
