import 'package:FarmMojo/src/screens/pond/widgets/harvest_details.dart';
import 'package:FarmMojo/src/screens/pond/widgets/stocking_details.dart';
import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class PondAppBar extends StatelessWidget {
  final Function(Widget) showBottomScreen;
  final Function goBack;

  PondAppBar({this.showBottomScreen, this.goBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: theme.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Image.asset("assets/icons/arrow.png"),
              tooltip: "back Button",
              onPressed: goBack),
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (value) {
              if (value == 0) {
                print("showStaock details");
                showBottomScreen(StockingDetails());
              } else {
                print("show Harvest details.");
                showBottomScreen(HarvestDetails());
              }
            },
            padding: EdgeInsets.all(0.0),
            itemBuilder: (context) => <PopupMenuEntry<int>>[
                  PopupMenuItem<int>(
                    value: 0,
                    child: Container(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.topCenter,
                        child: Center(
                            child: Text(
                          'Stock Details',
                          style: theme.normalTextStyle,
                        ))),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Container(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.topCenter,
                        child: Center(
                            child: Text(
                          'Harvest Details',
                          style: theme.normalTextStyle,
                        ))),
                  ),
                ],
          )
        ],
      ),
    );
  }
}
