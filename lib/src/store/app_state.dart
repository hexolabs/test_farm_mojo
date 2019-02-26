import 'package:FarmMojo/src/store/states/auth_state.dart';
import 'package:FarmMojo/src/store/states/login_state.dart';
import 'package:FarmMojo/src/store/states/pond_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final AuthState authState;
  final LoginState loginState;
  final PondState pondState;

  const AppState(
      {@required this.authState,
      @required this.loginState,
      @required this.pondState});

  factory AppState.initial() => AppState(
      authState: AuthState.initial(),
      loginState: LoginState.initial(),
      pondState: PondState.initial());

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          authState == other.authState &&
          loginState == other.loginState &&
          pondState == other.pondState;

  @override
  int get hashCode =>
      super.hashCode ^
      authState.hashCode ^
      loginState.hashCode ^
      pondState.hashCode;

  @override
  String toString() =>
      'AppState { splashState : $authState, loginState: $loginState, pondState: $pondState}';
}
