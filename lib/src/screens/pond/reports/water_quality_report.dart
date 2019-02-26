import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class WaterQualityReport extends StatefulWidget {
  @override
  _WaterQualityReportState createState() => _WaterQualityReportState();
}

class _WaterQualityReportState extends State<WaterQualityReport> {
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
              "Last report: 13-02-19",
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
                      child: Text("PARAMETERS", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("VALUES", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("OPTIMUM LEVEL", textAlign: TextAlign.center,),
                    )
                  ]),
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("PH", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("8.7", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("7.5 - 8.5", textAlign: TextAlign.center,),
                    )
                  ]),
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Salinity", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("12", textAlign: TextAlign.center,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("10 - 25 PPT", textAlign: TextAlign.center,),
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
