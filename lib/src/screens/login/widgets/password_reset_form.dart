import 'package:FarmMojo/src/localization.dart';
import 'package:FarmMojo/src/repository/models/login_user_model.dart';
import 'package:FarmMojo/src/store/states/login_state.dart';
import 'package:FarmMojo/src/utils/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class PassResetForm extends StatefulWidget {
  final LoginState state;
  final Function(LoginUserModel) resetPassword;

  final resetFormKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormFieldState<String>>();
  final passConfirmKey = GlobalKey<FormFieldState<String>>();

  PassResetForm({this.state, this.resetPassword});

  @override
  _PassResetFormState createState() => _PassResetFormState();
}

class _PassResetFormState extends State<PassResetForm> {
  final focusConfirmPassword = FocusNode();

  bool _autoValidate = false;

  void _onFormSubmit() {
    final form = widget.resetFormKey.currentState;

    if (form.validate()) {
      print(widget.passwordKey.currentState.value);
      final String password = widget.passwordKey.currentState.value;

      print(widget.state.loginUser.copyWith(password: password));

      widget.resetPassword(widget.state.loginUser.copyWith(password: password));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var password = TextFormField(
      key: widget.passwordKey,
      autofocus: true,
      autovalidate: _autoValidate,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: true,
      style: theme.normalTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
      validator: (val) => FormValidator.validatePassword(val),
      onFieldSubmitted: (val) =>
          FocusScope.of(context).requestFocus(focusConfirmPassword),
      enabled: !widget.state.showLoading,
      decoration: InputDecoration(
          labelText: FarmMojoLocalizations.of(context).passwordLabel, enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none),
    );

    var confirmPassword = TextFormField(
      key: widget.passConfirmKey,
      autovalidate: _autoValidate,
      keyboardType: TextInputType.text,
      focusNode: focusConfirmPassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      style: theme.normalTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
      validator: (val) => widget.passwordKey.currentState.value !=
              widget.passConfirmKey.currentState.value
          ? "Password Does not Match"
          : null,
      onFieldSubmitted: (val) => _onFormSubmit(),
      enabled: !widget.state.showLoading,
      decoration: InputDecoration(
          labelText: FarmMojoLocalizations.of(context).confirmPasswordLabel, enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none),
    );

    return Form(
        key: widget.resetFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    child: password),
                      SizedBox(height: 5,),
                      Divider(),
                      SizedBox(height: 5,),
                      Container(
                        height: 40,
                        child: confirmPassword),
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
                    child: Text(FarmMojoLocalizations.of(context).reset, style: theme.normalTextStyle.copyWith(color: Colors.white, fontSize: 16),),
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
              ),
            )
          ],
        ));
  }
}
