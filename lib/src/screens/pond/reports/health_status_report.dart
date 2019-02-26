import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class HealthStatusReport extends StatefulWidget {
  @override
  _HealthStatusReportState createState() => _HealthStatusReportState();
}

class _HealthStatusReportState extends State<HealthStatusReport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Health status overview: ",
              style: theme.titleTextStyle.copyWith(
                  color: theme.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
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
                      child: Text("Gill", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Gut", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Body", textAlign: TextAlign.center,),
                    )
                  ]),
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("13/02/19", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("thin", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("thick", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("thick", textAlign: TextAlign.center,),
                    )
                  ]),
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("05/02/19", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("thin", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("thick", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("thick", textAlign: TextAlign.center,),
                    )
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
