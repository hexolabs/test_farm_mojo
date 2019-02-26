import 'package:FarmMojo/src/repository/models/login_user_model.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState{
  final bool showLoading;
  final LoginUserModel loginUser;
  final String error;

  const LoginState({@required this.showLoading, @required this.loginUser, @required this.error});

  factory LoginState.initial() => LoginState(showLoading: false, loginUser: null, error: "");

  LoginState copyWith({bool showLoading, LoginUserModel loginUser, String error}) => LoginState(
      showLoading: showLoading ?? this.showLoading, loginUser: loginUser ?? this.loginUser, error: error ?? this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoginState &&
              runtimeType == other.runtimeType &&
              showLoading == other.showLoading &&
              loginUser == other.loginUser &&
              error == other.error;

  @override
  int get hashCode => showLoading.hashCode ^ error.hashCode ^ loginUser.hashCode;

  @override
  String toString() => 'LoginState { isLoading:$showLoading, loginUser: $loginUser, error: $error }';

}