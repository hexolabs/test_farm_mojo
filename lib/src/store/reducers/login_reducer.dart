import 'package:FarmMojo/src/store/actions/login_actions.dart';
import 'package:FarmMojo/src/store/states/login_state.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState, SendPassResetAction>(_sendPassReset),
  TypedReducer<LoginState, LoginAction>(_login),
  TypedReducer<LoginState, LoginSuccessAction>(_loginSuccess),
  TypedReducer<LoginState, LoginFailAction>(_loginFail),
  TypedReducer<LoginState, PassResetAction>(_passReset),
  TypedReducer<LoginState, PassResetSuccessAction>(_passResetSuccess),
  TypedReducer<LoginState, PassResetFailAction>(_passResetFail),
]);

LoginState _login(LoginState state, LoginAction action) =>
    state.copyWith(showLoading: true, loginUser: action.loginUser);

LoginState _loginFail(LoginState state, LoginFailAction action) =>
    state.copyWith(showLoading: false, error: action.errMessage);

LoginState _loginSuccess(LoginState state, LoginSuccessAction action) =>
    state.copyWith(showLoading: false);

LoginState _passReset(LoginState state, PassResetAction action) =>
    state.copyWith(showLoading: false, loginUser: action.loginUser, error: "");

LoginState _sendPassReset(LoginState state, SendPassResetAction action) =>
    state.copyWith(showLoading: true, loginUser: action.loginUser);

LoginState _passResetSuccess(LoginState state, PassResetSuccessAction action) =>
    state.copyWith(showLoading: false, loginUser: action.loginUser, error: "");

LoginState _passResetFail(LoginState state, PassResetFailAction action) =>
    state.copyWith(showLoading: false, error: action.errMessage);
