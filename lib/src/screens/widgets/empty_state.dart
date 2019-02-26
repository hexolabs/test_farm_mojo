import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String msg;
  final String img;

  EmptyState({Key key, @required this.msg, @required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset(
              img,
              width: 50.0,
              height: 50.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}