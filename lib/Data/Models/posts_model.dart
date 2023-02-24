class PostsModel {
  late int flag;
  late String message;
  List<PostsData> data = [];

  PostsModel.fromJson(Map<String, dynamic> json) {
    flag = json["flag"];
    message = json["message"];
    json["data"].forEach((element) {
      data.add(PostsData.fromjson(element));
    });
  }
}

class PostsData {
  String? postId;
  String? postTitle;
  String? postContent;
  String? userName;
  String? userId;
  PostsData.fromjson(Map<String, dynamic> json) {
    postId = json["post_id"];
    postTitle = json["post_title"];
    postContent = json["post_content"];
    userName = json["user_name"];
    userId = json["users_id"];
  }
}
