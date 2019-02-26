import 'package:FarmMojo/src/repository/repository.dart';
import 'package:FarmMojo/src/store/actions/auth_actions.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> authCheck(Repository _repos) {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    _repos.getUser().then((user) {
      store.dispatch(user == null ? GotoLoginAction() : GotoHomeAction(user: user));
    }).catchError((error) {
      print("error: $error");
    });
  };
}
