class TasksModel{
  late int flag;
  late String message;
  List<TaskData>? data  = [];

  TasksModel.fromjson(Map<String,dynamic> json){
    flag = json["flag"];
    message = json["message"];
    json["data"].forEach((e){
      data!.add(TaskData.fromjson(e));
    });
  }
}

class TaskData{
  String? taskNum;
  String? taskTitle;
  String? taskContent;
  String? taskId;
  String? taskFrom;
  String? taskTo ;

  TaskData.fromjson(Map<String,dynamic> json){
    taskNum = json["0"];
    taskTitle = json["1"];
    taskContent = json["task_content"];
    taskId = json["task_id"];
    taskFrom = json["task_from"];
    taskTo = json["task_To"];
  }
}