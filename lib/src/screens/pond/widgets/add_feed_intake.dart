import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class AddFeedIntake extends StatefulWidget {
  @override
  _AddFeedIntakeState createState() => _AddFeedIntakeState();
}

class _AddFeedIntakeState extends State<AddFeedIntake> {
  List<DropdownMenuItem<int>> feedTypeListDrop = [];

  @override
  void initState() {
    feedTypeListDrop.add(DropdownMenuItem(
      child: Text("Feed Type 1"),
      value: 0,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var feedTypes = DropdownButtonHideUnderline(
      child: DropdownButton(
        style: theme.subTitleTextStyle.copyWith(fontSize: 18.0),
        isDense: false,
        hint: Text(
          "Select feed type",
          style: theme.subTitleTextStyle
              .copyWith(color: theme.textColor, fontSize: 16),
        ),
        items: feedTypeListDrop,
        onChanged: (value) {},
      ),
    );

    return Container(
        padding:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 30.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(shrinkWrap: true, children: <Widget>[
            Text("Enter Daily Feed Intake:",
                style: theme.titleTextStyle.copyWith(
                    color: theme.textColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerRight,
              child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: feedTypes,
                  )),
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              child: Table(
                border: TableBorder(
                    horizontalInside:
                        BorderSide(width: 0.2, color: theme.tableBorderColor),
                    verticalInside:
                        BorderSide(width: 0.2, color: theme.tableBorderColor)),
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Date",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Feed Intake",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total feed",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "13/02/19",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "20 kg",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1.22 ton",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 58.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  elevation: 6,
                  color: Colors.white,
                  child: Text(
                    "Cancel",
                    style: theme.subTitleTextStyle
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30.0,
                ),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 58.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  elevation: 6,
                  color: theme.primaryColor,
                  child: Text(
                    "Save",
                    style: theme.subTitleTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ]),
        ));
  }
}
