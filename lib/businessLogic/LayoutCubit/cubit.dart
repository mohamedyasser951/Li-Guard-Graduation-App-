import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitState());

 static LayoutCubit get(context) => BlocProvider.of(context);

  bool isDark = true;

  changeAppMode({bool? isdark}) {
    isDark = !isDark;
    emit(ChangeAppModeState());
  }
}
