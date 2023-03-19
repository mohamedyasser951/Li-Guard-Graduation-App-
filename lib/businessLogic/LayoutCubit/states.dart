import 'package:asps/Data/Models/messages_model.dart';
import 'package:asps/Data/Models/tasks_model.dart';

abstract class LayoutStates {}

class InitState extends LayoutStates {}

// change AppMode
class ChangeAppModeState extends LayoutStates {}

//change BottomNav
class ChangeBottomNavState extends LayoutStates {}

// Get Posts
class GetPostsLoadingState extends LayoutStates {}

class GetPostsSuccessState extends LayoutStates {}

class GetPostsErrorState extends LayoutStates {}

// Get Tasks
class GetTasksLoadingState extends LayoutStates {}

class GetTasksSuccessState extends LayoutStates {
  final List<TaskData> tasks;
  GetTasksSuccessState({required this.tasks});
}

class GetTasksErrorState extends LayoutStates {}

// Get Messages
class GetMessagesLoadingState extends LayoutStates {}

class GetMessagesSuccessState extends LayoutStates {
  final List<MessageData> messages;
  GetMessagesSuccessState({required this.messages});
}

class GetMessagesErrorState extends LayoutStates {}
