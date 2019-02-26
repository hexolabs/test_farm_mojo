class LoginUserModel {
  final String username;
  final String password;
  final String session;

  LoginUserModel({this.username, this.password, this.session});

  LoginUserModel.fromJson(dynamic json)
      : username = json['username'],
        password = json["password"],
        session = json['session'];

  LoginUserModel copyWith({String username, String password, String session}) =>
      LoginUserModel(
          username: username ?? this.username,
          password: password ?? this.password,
          session: session ?? this.session);

  @override
  String toString() =>
      '{username: $username, password: $password, session: $session}';

  toJsonLogin() => {"username": "+91$username", "password": password};

  toJsonChallenge() =>
      {"username": "+91$username", "password": password, 'session': session};

  toJsonLastLoggedInUser() => {"username": username};
}
