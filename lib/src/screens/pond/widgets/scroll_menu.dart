import 'package:FarmMojo/src/store/states/pond_state.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;
import 'package:flutter/material.dart';

class ScrollMenu extends StatelessWidget {
  final selectedItem;
  final List<PondMenuItems> menuItems;

  final Function(PondMenuItems) changeMenuItem;

  ScrollMenu(
      {@required this.selectedItem,
      @required this.menuItems,
      @required this.changeMenuItem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: menuItems
              .map((menu) => Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: InkWell(
                        onTap: () {
                          changeMenuItem(menu);
                        },
                        child: Card(
                            color: menu == selectedItem
                                ? theme.primaryColor
                                : theme.unSelectedColor,
                            elevation: 0.0,
                            child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  menu.toString().split(".").last.replaceAll("_", " "),
                                  style: theme.normalTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: menu == selectedItem
                                          ? Colors.white
                                          : theme.textColor),
                                )))),
                  ))
              .toList()),
    );
  }
}
