import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;


class GrowthReport extends StatefulWidget {
  @override
  _GrowthReportState createState() => _GrowthReportState();
}

class _GrowthReportState extends State<GrowthReport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Text(
              "Available Shrimp: 4.2 ton\nCounts: 60",
              style: theme.titleTextStyle.copyWith(
                  color: theme.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Image.asset("assets/icons/inr.png", height: 10, width: 10,), Text("check market price", style: theme.normalTextStyle.copyWith(color: theme.primaryColor, decoration: TextDecoration.underline),)
            ],),
            SizedBox(height: 15.0,),

            Card(

              child: Table(
                defaultColumnWidth: IntrinsicColumnWidth(flex: 1),
                border: TableBorder(
                    horizontalInside:
                    BorderSide(width: 0.2, color: theme.tableBorderColor),
                    verticalInside:
                    BorderSide(width: 0.2, color: theme.tableBorderColor)),
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Date", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("DOC", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Average", textAlign: TextAlign.center,),
                    )
                  ]),
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("13/02/19", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("44", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18g", textAlign: TextAlign.center,),
                    )
                  ]),
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("08/02/19", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("38", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("16g", textAlign: TextAlign.center,),
                    )
                  ]),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
