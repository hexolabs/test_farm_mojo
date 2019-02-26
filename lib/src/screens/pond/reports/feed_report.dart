import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class FeedReport extends StatefulWidget {
  @override
  _FeedReportState createState() => _FeedReportState();
}

class _FeedReportState extends State<FeedReport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Card(
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
                    child: Text("Feed Intake", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Total", textAlign: TextAlign.center,),
                  )
                ]),
                TableRow(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("13/02/19", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("20 kg\nCP", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("1.22 ton", textAlign: TextAlign.center,),
                  )
                ]),
                TableRow(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("14/02/19", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("70 kg\nCP", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("1.20 ton", textAlign: TextAlign.center,),
                  )
                ]),
              ],
            ),
          ),
        ));
  }
}
