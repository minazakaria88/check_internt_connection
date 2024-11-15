import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:check_internet_connection/internet_connection_cubit/internet_state.dart';
import 'package:check_internet_connection/main.dart';
import 'package:check_internet_connection/no_internet_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitState());

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  bool isNoInternetConnectionScreenPushed = false;
  void checkInternetConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result[0] == ConnectivityResult.none) {
       noInternetConnection();
      } else {
       internetConnected();
      }
    });
  }

  void noInternetConnection() {
    Navigator.of(NavigatorService.navigatorKey.currentContext!)
        .push(MaterialPageRoute(
      builder: (context) => const NoInternetScreen(),
    ));
    isNoInternetConnectionScreenPushed = true;
    emit(InternetDisconnectedState());
  }

  void internetConnected() {
    if(isNoInternetConnectionScreenPushed){
      Navigator.of(NavigatorService.navigatorKey.currentContext!).pop();
      isNoInternetConnectionScreenPushed = false;
      emit(InternetConnectedState());
    }

  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
