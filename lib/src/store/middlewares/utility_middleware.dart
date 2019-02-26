import 'package:FarmMojo/src/store/actions/utility_actions.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

Middleware<AppState> goBack() {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    GoBackAction _goBack = action as GoBackAction;
    if (Navigator.canPop(_goBack.context)) {
      Navigator.pop(_goBack.context);
    }
  };
}

Middleware<AppState> gotoNextClassScreen() {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    GotoNextScreenAction nextScreen = action as GotoNextScreenAction;
    Navigator.push(nextScreen.context,
        MaterialPageRoute(builder: (context) => nextScreen.screen));
  };
}

Middleware<AppState> gotoHomeScreen() {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    Navigator.popUntil(
        action.context, ModalRoute.withName(FarmMojoRoutes.init));
  };
}
