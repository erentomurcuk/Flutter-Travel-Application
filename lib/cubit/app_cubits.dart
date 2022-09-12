import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_application/pages/welcome_page.dart';
import 'package:travel_application/services/data_services.dart';

import '../model/data_model.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {

  // First off we will call InitialState then we will call WelcomeState
  AppCubits({required this.data}):super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch(e) {
      debugPrintStack();
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}