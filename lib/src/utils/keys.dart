
import 'package:flutter/material.dart';


// Login Screen Keys
final loginScreen = const Key('__loginScreen__');
final loginScaffoldKey = GlobalKey<ScaffoldState>();

final loginLoading = const Key('__loginLoading__');
final resetKey = const Key('__resetKey__');

// Home Screens
final homeScreen = const Key('__homeScreen__');
final farmsLoading = const Key('__farmsLoading__');
final farmsEmptyState = const Key('__farmEmptyState__');
final homeScreenLoginKey = const Key('__homeScreenLoginKey__');
final userActionButton = const Key('__userActionButton__');

//Profile Screen
final profileScreen = const Key("__profileScreen__");

// Farm Details Screen
final farmScreen = const Key('__farmScreen__');
final farmEmptyState = const Key('__farmEmptyState__');
final stockEstimateFormKey = GlobalKey<FormState>();

// Pond Details Screen
final pondDetailsScreen = const Key('__pondDetailsScreen__');
final resultsLoading = const Key('__resultsLoading__');
final stockFormKey = GlobalKey<FormState>();

// Add Edit Result Screen
final addEditResultScreen = const Key('__addEditResultScreen__');