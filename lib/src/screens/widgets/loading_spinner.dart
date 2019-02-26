import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  LoadingSpinner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x56000000),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}