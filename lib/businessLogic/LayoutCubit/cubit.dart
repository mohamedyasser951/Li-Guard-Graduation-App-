import 'package:asps/Data/Models/tasks_model.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  late TasksModel tasksModel;
  getTasks() async{
    emit(GetTasksLoadingState());
   await Crud.getReguest(GETTASKS).then((value) {
      tasksModel = TasksModel.fromjson(value);
      print("get tasks $value");
      emit(GetTasksSuccessState());
    }).catchError((error) {
      emit(GetTasksErrorState());
    });
  }

  bool isDark = false;
  changeAppMode({bool? isdark}) {
    isDark = !isDark;
    emit(ChangeAppModeState());
  }
}
