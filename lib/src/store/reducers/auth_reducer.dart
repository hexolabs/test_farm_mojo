import 'package:FarmMojo/src/store/actions/auth_actions.dart';
import 'package:FarmMojo/src/store/states/auth_state.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, GotoLoginAction>(_gotoLogin),
  TypedReducer<AuthState, GotoHomeAction>(_gotoHome),
]);

AuthState _gotoLogin(AuthState state, GotoLoginAction action) =>
    state.copyWith(state: UserState.login);

AuthState _gotoHome(AuthState state, GotoHomeAction action) =>
    state.copyWith(state: UserState.home, user: action.user);