import 'package:FarmMojo/src/localization.dart';
import 'package:FarmMojo/src/repository/models/login_user_model.dart';
import 'package:FarmMojo/src/store/states/login_state.dart';
import 'package:FarmMojo/src/utils/form_validator.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final LoginState state;
  final loginFormKey = GlobalKey<FormState>();
  final Function(LoginUserModel) login;

  LoginForm({@required this.state, @required this.login});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final focusPassword = FocusNode();
  String _phno, _password;
  bool _autoValidate = false;

  @override
  void initState() {
    _phno = widget.state.loginUser?.username ?? "";
    _password = widget.state.loginUser?.password ?? "";
    super.initState();
  }

  void _onFormSubmit() {
    final form = widget.loginFormKey.currentState;
    if (form.validate()) {
      form.save();
      widget.login(LoginUserModel(username: _phno, password: _password));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var phno = TextFormField(
      initialValue: _phno,
      autovalidate: _autoValidate,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (val) =>
          FocusScope.of(context).requestFocus(focusPassword),
      validator: (val) => FormValidator.validateMobile(val),
      onSaved: (val) {
        _phno = val;
      },
      enabled: !widget.state.showLoading,
      style: theme.normalTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
      decoration: InputDecoration(
          hintText: FarmMojoLocalizations.of(context).phnoHint,
          labelText: FarmMojoLocalizations.of(context).phnoLabel,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none),
    );

    var password = TextFormField(
      initialValue: _password,
      autovalidate: _autoValidate,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: true,
      style: theme.normalTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
      focusNode: focusPassword,
      validator: (val) => FormValidator.validatePassword(val),
      onFieldSubmitted: (val) => _onFormSubmit(),
      onSaved: (val) {
        _password = val;
      },
      enabled: !widget.state.showLoading,
      decoration: InputDecoration(

          labelText: FarmMojoLocalizations.of(context).passwordLabel,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none),
    );

    return Form(
        key: widget.loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 0.0, right: 20.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 40,
                          child: phno),
                      SizedBox(height: 5,),
                      Divider(),
                      SizedBox(height: 5,),
                      Container(
                        height: 40.0,
                          child: password),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: theme.primaryColor,
                  onPressed: widget.state.showLoading ? null : _onFormSubmit,
                  child: Text(FarmMojoLocalizations.of(context).login, style: theme.normalTextStyle.copyWith(color: Colors.white, fontSize: 16),),
                ),
                SizedBox(
                  width: widget.state.showLoading ? 10.0 : 0.0,
                ),
                Container(
                    width: 20.0,
                    height: 20.0,
                    child: widget.state.showLoading
                        ? CircularProgressIndicator()
                        : Container())
              ],
            ))
          ],
        ));
  }
}
