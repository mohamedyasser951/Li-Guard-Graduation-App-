import 'package:asps/Data/Models/tasks_model.dart';

abstract class LayoutStates {}

class InitState extends LayoutStates {}

// change AppMode
class ChangeAppModeState extends LayoutStates {}

// Get Posts
class GetPostsLoadingState extends LayoutStates {}

class GetPostsSuccessState extends LayoutStates {}

class GetPostsErrorState extends LayoutStates {}

// Get Tasks
class GetTasksLoadingState extends LayoutStates {}

class GetTasksSuccessState extends LayoutStates {
  final TasksModel tasksModel;
  GetTasksSuccessState({required this.tasksModel});
}

class GetTasksErrorState extends LayoutStates {}
