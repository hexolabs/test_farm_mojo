import 'package:FarmMojo/src/repository/repository.dart';
import 'package:FarmMojo/src/store/actions/auth_actions.dart';
import 'package:FarmMojo/src/store/actions/login_actions.dart';
import 'package:FarmMojo/src/store/actions/utility_actions.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/store/middlewares/auth_middleware.dart';
import 'package:FarmMojo/src/store/middlewares/login_middleware.dart';
import 'package:FarmMojo/src/store/middlewares/utility_middleware.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> appMiddleware(
    [Repository _repo = const Repository()]) {
  final Middleware<AppState> _authCheck = authCheck(_repo);
  final Middleware<AppState> _login = login(_repo);
  final Middleware<AppState> _sendPassReset = sendPassReset(_repo);
  final Middleware<AppState> _gotoNextScreen = gotoNextClassScreen();
  final Middleware<AppState> _gotoBack = goBack();

  return [
    TypedMiddleware<AppState, AuthCheckAction>(_authCheck),
    TypedMiddleware<AppState, LoginAction>(_login),
    TypedMiddleware<AppState, SendPassResetAction>(_sendPassReset),
    TypedMiddleware<AppState, GotoNextScreenAction>(_gotoNextScreen),
    TypedMiddleware<AppState, GoBackAction>(_gotoBack),
  ];
}
