import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class EstimatedStockingWidget extends StatefulWidget {
  @override
  _EstimatedStockingWidgetState createState() => _EstimatedStockingWidgetState();
}

class _EstimatedStockingWidgetState extends State<EstimatedStockingWidget> {
  List<DropdownMenuItem<int>> speciesListDrop = [];

  @override
  void initState() {
    speciesListDrop.add(DropdownMenuItem(
      child: Text("L. Vannamei"),
      value: 0,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var seedRequirement = TextFormField(
      style: TextStyle(color: theme.textColor),
      textInputAction: TextInputAction.next,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: false),
      onFieldSubmitted: (v) {
        // FocusScope.of(context).requestFocus(focus);
      },
      onSaved: (String value) {},
      decoration: InputDecoration(
          hintStyle: TextStyle(color: theme.textColor),
          hintText: '',
          alignLabelWithHint: true),
      // validator: FormValidators.validateMobile,
    );

    var estimatedDate = InkWell(
        onTap: () {
          print("Select Date");
        },
        child: AbsorbPointer(
            absorbing: true,
            child: TextFormField(
              style: TextStyle(color: theme.textColor),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.datetime,
              onFieldSubmitted: (v) {
                // FocusScope.of(context).requestFocus(focus);
              },
              onSaved: (String value) {},
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: theme.textColor),
                  alignLabelWithHint: true,
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: theme.primaryColor,
                  )),
              // validator: FormValidators.validateMobile,
            )));

    var species = DropdownButtonHideUnderline(
      child: DropdownButton(
        style: theme.subTitleTextStyle.copyWith(fontSize: 18.0),
        isDense: false,
        value: 0,
        items: speciesListDrop,
        onChanged: (value) {},
      ),
    );

    var salinity = TextFormField(
      style: TextStyle(color: theme.textColor),
      textInputAction: TextInputAction.next,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: false),
      onFieldSubmitted: (v) {
        // FocusScope.of(context).requestFocus(focus);
      },
      onSaved: (String value) {},
      decoration: InputDecoration(
          hintStyle: TextStyle(color: theme.textColor),
          hintText: '',
          alignLabelWithHint: true),
      // validator: FormValidators.validateMobile,
    );

    return Container(
      padding:
          EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 30.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(
              "Estimated Stocking :",
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
                      child: Column(
                    children: <Widget>[
                      buildRow("Seed requirement", seedRequirement),
                      buildRow("Est. Date", estimatedDate),
                      buildRow("Species", species),
                      buildRow("Salinity", salinity),
                    ],
                  )),
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
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label, Widget child) => Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            label,
            style: theme.subTitleTextStyle.copyWith(fontSize: 18.0),
          )),
          Text(":"),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: child,
          ))
        ],
      ));
}
