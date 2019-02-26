import 'package:flutter/material.dart';

class GoBackAction {
  final BuildContext context;

  const GoBackAction(this.context);

  @override
  String toString() => 'GoBackAction {}';
}

class GotoHomeScreenAction {
  final BuildContext context;
  const GotoHomeScreenAction(this.context);
  @override
  String toString() => 'GotoHomeScreenAction {}';
}

class GotoNextScreenAction<T>{
  final BuildContext context;
  final T screen;

  GotoNextScreenAction(this.context, this.screen);
  @override
  String toString() => 'GotoNextScreenClassAction()';

}