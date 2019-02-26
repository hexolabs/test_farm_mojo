
import 'package:FarmMojo/src/repository/beans/user.dart';
import 'package:meta/meta.dart';

class AuthCheckAction {
  const AuthCheckAction();

  @override
  String toString() => "AuthCheckAction {}";
}

class GotoLoginAction {
  const GotoLoginAction();

  @override
  String toString() => "GotoLoginAction {}";
}

class GotoHomeAction {
  final User user;
  const GotoHomeAction({@required this.user});

  @override
  String toString() => "GotoHomeAction {User : $user}";
}