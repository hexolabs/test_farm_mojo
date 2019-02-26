import 'package:FarmMojo/src/repository/models/login_user_model.dart';
import 'package:meta/meta.dart';

class PasswordResetException implements Exception {
  final LoginUserModel loginUser;

  PasswordResetException({@required this.loginUser});

  @override
  String toString() {
    return "PasswordResetException${loginUser.toJsonLogin()}";
  }
}

class ResetPassword implements Exception {
  final LoginUserModel loginUser;
  ResetPassword([this.loginUser]);

  @override
  String toString() {
    return "User${loginUser.toString()}";
  }
}

class UserDoesNotExists implements Exception {
  UserDoesNotExists();
}

class FetchDataException implements Exception {
  final String _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "$_message";
  }
}
