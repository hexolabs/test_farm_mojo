import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class MedicineReport extends StatefulWidget {
  @override
  _MedicineReportState createState() => _MedicineReportState();
}

class _MedicineReportState extends State<MedicineReport> {

  List<DropdownMenuItem<String>> obsListDrop = [];
  List<DropdownMenuItem<String>> remListDrop = [];

  @override
  void initState() {
    obsListDrop.add(DropdownMenuItem(child: Text("White feacal"), value: "white feacal",));
    remListDrop.add(DropdownMenuItem(child: Text("Elixir"), value: "elixir",));
    super.initState();
  }

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
                    "Medicine: ",
                    style: theme.titleTextStyle.copyWith(
                        color: theme.textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                            Expanded(child: Text("Observation")),
                            Text(":"),
                            Expanded(child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isDense: false,
                                value: "white feacal",
                                items: obsListDrop, onChanged: (value){}, ),
                            )),
                          ],),
                          Row(
                            children: <Widget>[
                            Expanded(child: Text("Remidy")),
                            Text(":"),

                            Expanded(child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isDense: false,
                                value: "elixir",
                                items: remListDrop, onChanged: (value){}, ),
                            )),
                          ],),
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
