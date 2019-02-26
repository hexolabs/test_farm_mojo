import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class HarvestDetails extends StatefulWidget {
  @override
  _HarvestDetailsState createState() => _HarvestDetailsState();
}

class _HarvestDetailsState extends State<HarvestDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var harvestDate = InkWell(
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
                  contentPadding: EdgeInsets.all(0.0),
                  hintStyle: TextStyle(color: theme.textColor),
                  alignLabelWithHint: true,
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: theme.primaryColor,
                  )),
              // validator: FormValidators.validateMobile,
            )));

    var output = TextFormField(
      style: TextStyle(color: theme.textColor),
      textInputAction: TextInputAction.next,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: false),
      onFieldSubmitted: (v) {
        // FocusScope.of(context).requestFocus(focus);
      },
      onSaved: (String value) {},
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          hintStyle: TextStyle(color: theme.textColor),
          alignLabelWithHint: true),
      // validator: FormValidators.validateMobile,
    );

    var count = TextFormField(
      style: TextStyle(color: theme.textColor),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      onFieldSubmitted: (v) {
        // FocusScope.of(context).requestFocus(focus);
      },
      onSaved: (String value) {},
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          hintStyle: TextStyle(color: theme.textColor),
          alignLabelWithHint: true),
      // validator: FormValidators.validateMobile,
    );

    var buyer = TextFormField(
      style: TextStyle(color: theme.textColor),
      textInputAction: TextInputAction.next,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: false),
      onFieldSubmitted: (v) {
        // FocusScope.of(context).requestFocus(focus);
      },
      onSaved: (String value) {},
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          hintStyle: TextStyle(color: theme.textColor),
          hintText: '',
          alignLabelWithHint: true),
      // validator: FormValidators.validateMobile,
    );

    var sellingPrice = Container(
      height: 20.0,
      child: TextFormField(
        scrollPadding: EdgeInsets.all(0.0),

        style: TextStyle(color: theme.textColor),
        textInputAction: TextInputAction.done,
        keyboardType:
            TextInputType.numberWithOptions(decimal: true, signed: true),
        onFieldSubmitted: (v) {
          // FocusScope.of(context).requestFocus(focus);
        },
        onSaved: (String value) {},
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10.0),
            helperText: "in paise",
            prefixIcon: Padding(
              padding: EdgeInsets.zero,
              child: Image.asset(
                "assets/icons/inr.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            isDense: true,
            hintStyle: TextStyle(color: theme.textColor)),
        // validator: FormValidators.validateMobile,
      ),
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
              "Harvest Details",
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
                      buildRow("Date", harvestDate),
                      SizedBox(height: 15.0,),
                      buildRow("Output", output),
                      SizedBox(height: 15.0,),
                      buildRow("Count", count),
                      SizedBox(height: 15.0,),
                      buildRow("Buyer", buyer),
                      SizedBox(height: 15.0,),
                      buildRow("SellingPrice", sellingPrice),
                      SizedBox(height: 40.0),
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
