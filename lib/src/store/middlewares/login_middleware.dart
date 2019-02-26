import 'package:FarmMojo/src/repository/repository.dart';
import 'package:FarmMojo/src/store/actions/auth_actions.dart';
import 'package:FarmMojo/src/store/actions/login_actions.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/utils/exceptions.dart';
import 'package:redux/redux.dart';

Middleware<AppState> login(Repository _repos) {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    dispatch(action);

    await _repos
        .login(userModel: store.state.loginState.loginUser)
        .then((user) async {
      await _repos.saveUser(user);
      store.dispatch(LoginSuccessAction());
      store.dispatch(AuthCheckAction());
    }).catchError((error) {
      print(error);

      if (error is PasswordResetException) {
        store.dispatch(PassResetAction(store.state.loginState.loginUser
            .copyWith(session: error.loginUser.session)));
      } else {
        store.dispatch(LoginFailAction(error.response.data['message']));
      }
    });
  };
}

Middleware<AppState> sendPassReset(Repository _repo) {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    dispatch(action);

    await _repo
        .passReset(loginUser: store.state.loginState.loginUser)
        .then((user) {
      store.dispatch(LoginSuccessAction());
      store.dispatch(GotoHomeAction(user: user));
    }).catchError((error) {
      if (error is FetchDataException) {
        store.dispatch(PassResetFailAction(error.toString()));
      } else {
        store.dispatch(PassResetFailAction(error.response.data['message']));
      }
    });
  };
}
