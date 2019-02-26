import 'package:FarmMojo/src/repository/beans/user.dart';
import 'package:meta/meta.dart';

enum UserState { loading, login, home }

@immutable
class AuthState {
  final UserState state;
  final User user;

  const AuthState({this.state, this.user});

  factory AuthState.initial() =>
      AuthState(state: UserState.loading, user: null);

  AuthState copyWith({UserState state, User user}) {
    return AuthState(state: state ?? this.state, user: user ?? this.user);
  }

  @override
  bool operator ==(other) =>
      identical(other, this) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          user == other.user;

  @override
  int get hashCode => super.hashCode ^ state.hashCode ^ user.hashCode;

  @override
  String toString() => 'AuthState {CurrentState: $state, User: $user}';
}
