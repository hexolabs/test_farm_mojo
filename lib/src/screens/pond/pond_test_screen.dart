import 'package:FarmMojo/src/screens/pond/widgets/add_feed_intake.dart';
import 'package:FarmMojo/src/screens/pond/widgets/add_growth_data.dart';
import 'package:flutter/material.dart';

class PondTestScreen extends StatefulWidget {
  @override
  _PondTestScreenState createState() => _PondTestScreenState();
}

class _PondTestScreenState extends State<PondTestScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AddFeedIntake(),
    );
  }
}