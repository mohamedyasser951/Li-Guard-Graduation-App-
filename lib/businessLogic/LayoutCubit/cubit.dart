// ignore_for_file: avoid_print

import 'package:asps/Data/Models/messages_model.dart';
import 'package:asps/Data/Models/posts_model.dart';
import 'package:asps/Data/Models/tasks_model.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/shared/network/local/shared_helper.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  late PostsModel postsModel;
  getPosts() async {
    emit(GetPostsLoadingState());
    Crud.getReguest(GETPOSTS).then((value) {
      postsModel = PostsModel.fromJson(value);
      emit(GetPostsSuccessState());
    }).catchError((error) {
      emit(GetPostsErrorState());
    });
  }

  List<MessageData> messages = [];
  getMessages() async {
    emit(GetMessagesLoadingState());
    Crud.getReguest(GETMESSAGES).then((value) {
      value["data"].forEach((element) {
        messages.add(MessageData.fromJson(element));
      });
      emit(GetMessagesSuccessState(messages: messages));
    }).catchError((error) {
      emit(GetMessagesErrorState());
    });
  }

  List<TaskData> tasks = [];
  getTasks() async {
    emit(GetTasksLoadingState());
    await Crud.getReguest(GETTASKS).then((value) {
      value["data"].forEach((element) {
        tasks.add(TaskData.fromjson(element));
      });
      print("get tasks $value");
      emit(GetTasksSuccessState(tasks: tasks));
    }).catchError((error) {
      print(error.toString());
      emit(GetTasksErrorState());
    });
  }

  bool isDark = false;
  changeAppMode({bool? isDarkFromShared}) {
    if (isDarkFromShared != null) {
      isDark = isDarkFromShared;
      emit(ChangeAppModeState());
    } else {
      isDark = !isDark;
      SharedHelper.saveData(key: "isDark", value: isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }
  }

  int currentindex = 0;
  changBottomNav({required int index}) {
    if (index == 3 && messages.isEmpty) {
      getMessages();
    }
    if (index == 2 && tasks.isEmpty) {
      getTasks();
    }
    currentindex = index;
    emit(ChangeBottomNavState());
  }
}
