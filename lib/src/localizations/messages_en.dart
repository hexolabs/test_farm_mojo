// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(task) => "Deleted \"${task}\"";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => {
        "farms": MessageLookupByLibrary.simpleMessage("Farms"),
        "ponds": MessageLookupByLibrary.simpleMessage("Ponds"),
        "appTitle": MessageLookupByLibrary.simpleMessage("FARM MOJO"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "phnoLabel": MessageLookupByLibrary.simpleMessage("PHNO"),
        "phnoHint": MessageLookupByLibrary.simpleMessage("96XXXXXXXX"),
        "passwordLabel": MessageLookupByLibrary.simpleMessage("PASSWORD"),
        "confirmPasswordLabel":
            MessageLookupByLibrary.simpleMessage("CONFIRM PASSWORD"),
        "farmsEmptyMessage": MessageLookupByLibrary.simpleMessage(
            "No farms to show\nContact Aquaconnect admin"),
        "farmsList": MessageLookupByLibrary.simpleMessage("Farms List"),
        "pondsList": MessageLookupByLibrary.simpleMessage("Ponds List"),
        "noOfPonds": MessageLookupByLibrary.simpleMessage("No. of ponds"),
        "estStocking": MessageLookupByLibrary.simpleMessage("Est. stocking"),
        "estDensity": MessageLookupByLibrary.simpleMessage("Est. Density"),
        "estDate": MessageLookupByLibrary.simpleMessage("Est. Date"),
        "species": MessageLookupByLibrary.simpleMessage("Species"),
        "salinity": MessageLookupByLibrary.simpleMessage("Salinity"),
        "pondsEmptyMessage": MessageLookupByLibrary.simpleMessage(
            "No ponds to show\nCreate new pond"),
        "addPond": MessageLookupByLibrary.simpleMessage("Add Pond"),
        "newPonds": MessageLookupByLibrary.simpleMessage("New Ponds"),
        "enterNewPond": MessageLookupByLibrary.simpleMessage("Endter new Pond"),
        "pondName": MessageLookupByLibrary.simpleMessage("Pond Name (ID)"),
        "pondArea": MessageLookupByLibrary.simpleMessage("Pond Area"),
        "resultsEmptyMessage":
            MessageLookupByLibrary.simpleMessage("Add New Result"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "Do": MessageLookupByLibrary.simpleMessage("Do"),
      };
}
