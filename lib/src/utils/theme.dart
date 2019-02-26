import 'package:flutter/material.dart';

const Color arrowBackgroundColor = Color(0xFFDADADA);
const Color textColor = Color(0xFF676767);
const Color cardBgColor = Color(0xFFE6E6E6);
const Color primaryColor = Color(0xff3891F2);
const Color backgroundColor = Color(0xffF9F9F9);
final Color errorColor = Color(0xFFDB2D43);
final Color unSelectedColor = Color(0xFFE4E4E4);
final Color tableBorderColor = Color(0xFF707070);
final Color floatActionBtnColor = Color(0xFF45EBA5);

final originalTextTheme = ThemeData.light().textTheme;

final titleTextStyle = originalTextTheme.title.copyWith(
    color: Colors.white,
    fontFamily: 'WorkSans'
);

final subTitleTextStyle = originalTextTheme.subhead.copyWith(
    color: textColor,
    fontFamily: 'WorkSans'
);

final normalTextStyle = originalTextTheme.subtitle.copyWith(
    color: textColor,
    fontFamily: 'WorkSans');

/*


  static get theme {
    final originalTextTheme = ThemeData
        .light()
        .textTheme;
    final originalBody1 = originalTextTheme.body1;
    final originalSubhead = originalTextTheme.subhead;

    return ThemeData.light().copyWith(

        textSelectionColor: Colors.cyan[100],
        backgroundColor: Color(0xffF9F9F9),
        buttonTheme: ButtonThemeData(
            buttonColor: Color(0xff3891F2),
            textTheme: ButtonTextTheme.primary
        ),
        textTheme: originalTextTheme.copyWith(
            title: TextStyle(
                color: Color.fromARGB(0xff, 61, 61, 61),
                fontSize: 22.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontFamily: 'WorkSans'),
            subtitle: TextStyle(
                color: Color.fromARGB(0xff, 61, 61, 61),
                fontSize: 18.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gilroy'),

            subhead: originalSubhead.copyWith(
              color: textColor,
              fontFamily: 'WorkSans',
            ),

            body1: TextStyle(
              fontFamily: 'WorkSans',
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
        ));
  }

*/
