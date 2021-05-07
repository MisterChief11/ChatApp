import 'package:bloc/bloc.dart';
import 'package:chatapp/Login.dart';
import 'package:chatapp/loading.dart';
import 'package:chatapp/screen1.dart';
import 'package:flutter/cupertino.dart';

part 'app_cubit_state.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(AppCubitState(screen: Loading()));

  void screendecider(bool a) {
    if (!a) {
      emit(AppCubitState(screen: screen_login()));
    } else if (a) {
      emit(AppCubitState(screen: Main_Screen()));
    }
  }
}
