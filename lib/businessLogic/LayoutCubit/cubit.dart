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

  List<PostsData> posts = [];
  getPosts() async {
    emit(GetPostsLoadingState());
    Crud.getReguest(GETPOSTS).then((value) {
      value["data"].forEach((element) {
        print(element);

        posts.add(PostsData.fromjson(element));
      });
      emit(GetPostsSuccessState(posts: posts));
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

  bool isDark = true;
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
    if (index == 1 && posts.isEmpty) {
      getPosts();
    }
    if (index == 3 && tasks.isEmpty) {
      getTasks();
    }
    if (index == 4 && messages.isEmpty) {
      getMessages();
    }

    currentindex = index;
    emit(ChangeBottomNavState());
  }
}
