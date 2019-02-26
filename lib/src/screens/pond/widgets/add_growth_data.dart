import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class AddGrowthData extends StatefulWidget {
  @override
  _AddGrowthDataState createState() => _AddGrowthDataState();
}

class _AddGrowthDataState extends State<AddGrowthData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 30.0),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(shrinkWrap: true, children: <Widget>[
              Text(
                "Growth Data:",
                style: theme.titleTextStyle.copyWith(
                    color: theme.textColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  //shape: CircleBorder(side: BorderSide(width: 16.0, color: Colors.lightBlue.shade50)),
                  elevation: 6.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      child: Table(
                        defaultColumnWidth: IntrinsicColumnWidth(flex: 1),
                        columnWidths: {1: FractionColumnWidth(0.42)},
                        border: TableBorder(
                            horizontalInside: BorderSide(
                                width: 0.2, color: theme.tableBorderColor),
                            verticalInside: BorderSide(
                                width: 0.2, color: theme.tableBorderColor)),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
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
                                "Sample Weight (g)",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Count",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Avg",
                                textAlign: TextAlign.center,
                              ),
                            )
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
                                "600g",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "30",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "29g",
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                  )),
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
            ])));
  }
}
