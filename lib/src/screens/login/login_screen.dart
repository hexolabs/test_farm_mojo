import 'package:FarmMojo/src/repository/models/login_user_model.dart';
import 'package:FarmMojo/src/screens/login/widgets/login_form.dart';
import 'package:FarmMojo/src/screens/login/widgets/password_reset_form.dart';
import 'package:FarmMojo/src/screens/widgets/widget_transition.dart';
import 'package:FarmMojo/src/store/actions/login_actions.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/store/states/login_state.dart';
import 'package:FarmMojo/src/utils/keys.dart' as keys;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keys.loginScaffoldKey,
      backgroundColor: Colors.white,
      body: StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: (store) => _ViewModel.create(store),
        onWillChange: (viewModel) {
          if (viewModel.state.error.isNotEmpty) {
            _onWidgetDidBuild(() {
              keys.loginScaffoldKey.currentState
                  .showSnackBar(SnackBar(content: Text(viewModel.state.error)));
            });
          }
        },
        builder: (context, viewModel) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 150,
                      child: Image.asset(
                        "assets/icons/LaunchImage.png",
                        fit: BoxFit.fitHeight,
                      )),
                  SizedBox(
                    height: 80,
                  ),
                  WidgetTransition(
                      child: viewModel.state.loginUser?.session == null
                          ? LoginForm(
                              state: viewModel.state,
                              login: viewModel.login,
                            )
                          : PassResetForm(
                              state: viewModel.state,
                              resetPassword: viewModel.passReset,
                            )),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

class _ViewModel {
  final LoginState state;
  final Function(LoginUserModel) login;
  final Function(LoginUserModel) passReset;

  _ViewModel({this.login, this.passReset, this.state});

  factory _ViewModel.create(Store<AppState> store) {
    _login(LoginUserModel _loginUser) =>
        store.dispatch(LoginAction(_loginUser));
    _passReset(LoginUserModel _loginUser) =>
        store.dispatch(SendPassResetAction(_loginUser));
    return _ViewModel(
        login: _login, passReset: _passReset, state: store.state.loginState);
  }
}
