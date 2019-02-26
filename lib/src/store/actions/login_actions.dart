
import 'package:FarmMojo/src/repository/models/login_user_model.dart';

class LoginAction {
  final LoginUserModel loginUser;

  const LoginAction(this.loginUser);

  @override
  String toString() => 'LoginAction { loginUser: $loginUser}';
}

class LoginSuccessAction {
  const LoginSuccessAction();

  @override
  String toString() => 'LoginSuccessAction { }';
}

class LoginFailAction {
  final String errMessage;

  const LoginFailAction(this.errMessage);

  @override
  String toString() => 'LoginFailAction {errMessage: $errMessage}';
}

class PassResetAction {
  final LoginUserModel loginUser;

  const PassResetAction(this.loginUser);

  @override
  String toString() => 'PassResetAction {}';
}

class SendPassResetAction {
  final LoginUserModel loginUser;

  const SendPassResetAction(this.loginUser);

  @override
  String toString() => 'SendPassResetAction {}';
}

class PassResetSuccessAction {
  final LoginUserModel loginUser;

  PassResetSuccessAction(this.loginUser);

  @override
  String toString() => 'ShowPassResetAction {}';
}

class PassResetFailAction {
  final String errMessage;

  PassResetFailAction(this.errMessage);

  @override
  String toString() => 'PasswordResetFailAction {errMessage: $errMessage}';
}

class LoginErrorMsgResetAction {
  LoginErrorMsgResetAction();

  @override
  String toString() => 'LoginErrorMsgResetAction {}';
}