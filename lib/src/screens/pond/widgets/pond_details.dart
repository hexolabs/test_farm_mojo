import 'package:flutter/material.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class PondDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Card(
            elevation: 4.0,
            child: Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Pond 1",
                            style: theme.normalTextStyle.copyWith(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                        Text("L. Vannamei"),
                      ])),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "45",
                            style: theme.normalTextStyle.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "\nDOC",
                                  style: theme.subTitleTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))
                            ]),
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "12",
                          style: theme.normalTextStyle.copyWith(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                                text: " g",
                                style: theme.subTitleTextStyle
                                    .copyWith(fontSize: 14)),
                            TextSpan(
                                text: "\nGrowth",
                                style: theme.subTitleTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ))
                          ]),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "1.5",
                          style: theme.normalTextStyle.copyWith(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                                text: " tons",
                                style: theme.subTitleTextStyle
                                    .copyWith(fontSize: 14)),
                            TextSpan(
                                text: "\nFeed Used",
                                style: theme.subTitleTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))
                          ]),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Stocked Volume",
                        style: theme.subTitleTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    SizedBox(width: 15.0,),
                    Text("4,00,000", style: theme.subTitleTextStyle.copyWith(
                        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400))
                  ],
                ),
              ),

            ])));
  }
}
