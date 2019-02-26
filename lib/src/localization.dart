import 'dart:async';

import 'package:FarmMojo/src/localizations/messages_all.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class FarmMojoLocalizations {
  FarmMojoLocalizations(this.locale);

  final Locale locale;

  static Future<FarmMojoLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString()).then((_) {
      return FarmMojoLocalizations(locale);
    });
  }

  static FarmMojoLocalizations of(BuildContext context) {
    return Localizations.of<FarmMojoLocalizations>(
        context, FarmMojoLocalizations);
  }

  String get appTitle => Intl.message(
        'FARM MOJO',
        name: 'appTitle',
        args: [],
        locale: locale.toString(),
      );

  String get profile => Intl.message(
        'Profile',
        name: 'profile',
        args: [],
        locale: locale.toString(),
      );

  String get login => Intl.message(
        'Login',
        name: 'login',
        args: [],
        locale: locale.toString(),
      );

  String get logout => Intl.message(
        'Logout',
        name: 'logout',
        args: [],
        locale: locale.toString(),
      );

  String get reset => Intl.message(
        'Reset',
        name: 'reset',
        args: [],
        locale: locale.toString(),
      );

  String get phnoLabel => Intl.message(
        'PHNO',
        name: 'phnoLabel',
        args: [],
        locale: locale.toString(),
      );

  String get phnoHint => Intl.message(
        '96XXXXXXXS',
        name: 'phnoHint',
        args: [],
        locale: locale.toString(),
      );

  String get passwordLabel => Intl.message(
        'PASSWORD',
        name: 'passwordLabel',
        args: [],
        locale: locale.toString(),
      );

  String get ponds => Intl.message(
        'Ponds',
        name: 'ponds',
        args: [],
        locale: locale.toString(),
      );

  String get farms => Intl.message(
        'Farms',
        name: 'farms',
        args: [],
        locale: locale.toString(),
      );

  String get confirmPasswordLabel => Intl.message(
        'CONFIRM PASSWORD',
        name: 'confirmPasswordLabel',
        args: [],
        locale: locale.toString(),
      );

  String get farmsEmptyMessage => Intl.message(
        'No farms to show\nContact Aquaconnect admin',
        name: 'farmsEmptyMessage',
        args: [],
        locale: locale.toString(),
      );

  String get farmsList => Intl.message(
        'Farms List',
        name: 'farmsList',
        args: [],
        locale: locale.toString(),
      );

  String get noOfPonds => Intl.message(
    'No. of ponds',
    name: 'noOfPonds',
    args: [],
    locale: locale.toString(),
  );

  String get estDensity => Intl.message(
    'Est. Density',
    name: 'estDensity',
    args: [],
    locale: locale.toString(),
  );

  String get estStocking => Intl.message(
    'Est. stocking',
    name: 'estStocking',
    args: [],
    locale: locale.toString(),
  );

  String get estDate => Intl.message(
    'Est. Date',
    name: 'estDate',
    args: [],
    locale: locale.toString(),
  );

  String get pl => Intl.message(
    'PL',
    name: 'pl',
    args: [],
    locale: locale.toString(),
  );

  String get hatchery => Intl.message(
    'Hatchery',
    name: 'hatchery',
    args: [],
    locale: locale.toString(),
  );

  String get species => Intl.message(
    'Species',
    name: 'species',
    args: [],
    locale: locale.toString(),
  );

  String get salinity => Intl.message(
    'Salinity',
    name: 'salinity',
    args: [],
    locale: locale.toString(),
  );
  String get seedCost => Intl.message(
    'Seed Cost',
    name: 'seedCost',
    args: [],
    locale: locale.toString(),
  );
  String get pondsList => Intl.message(
        'Ponds List',
        name: 'pondsList',
        args: [],
        locale: locale.toString(),
      );

  String get pondsEmptyMessage => Intl.message(
        'No ponds to show\nCreate new Pond',
        name: 'pondsEmptyMessage',
        args: [],
        locale: locale.toString(),
      );

  String get addPond => Intl.message(
        'Add Pond',
        name: 'addPond',
        args: [],
        locale: locale.toString(),
      );
  String get newPonds => Intl.message(
        'New Ponds',
        name: 'newPonds',
        args: [],
        locale: locale.toString(),
      );
  String get enterNewPond => Intl.message(
        'Enter new Pond',
        name: 'enterNewPond',
        args: [],
        locale: locale.toString(),
      );

  String get pondName => Intl.message(
    'Pond Name (ID)',
    name: 'pondName',
    args: [],
    locale: locale.toString(),
  );

  String get pondArea => Intl.message(
    'Pond Area',
    name: 'pondArea',
    args: [],
    locale: locale.toString(),
  );

  String get pondResultsEmptyMessage => Intl.message(
        'Add New Result',
        name: 'resultsEmptyMessage',
        args: [],
        locale: locale.toString(),
      );

  String get save => Intl.message(
        'Save',
        name: 'save',
        args: [],
        locale: locale.toString(),
      );

  String get update => Intl.message(
        'Update',
        name: 'udpate',
        args: [],
        locale: locale.toString(),
      );

  String get doLabel => Intl.message(
        'Do',
        name: 'Do',
        args: [],
        locale: locale.toString(),
      );

  String get phLabel => Intl.message(
        'PH',
        name: 'ph',
        args: [],
        locale: locale.toString(),
      );

  String get salinityLabel => Intl.message(
        'Salinity',
        name: 'salinity',
        args: [],
        locale: locale.toString(),
      );

  String get temperatureLabel => Intl.message(
        'Temperature',
        name: 'temperature',
        args: [],
        locale: locale.toString(),
      );

  String get turbidityLabel => Intl.message(
        'Turbidity',
        name: 'turbidity',
        args: [],
        locale: locale.toString(),
      );

  String get ammoniaLabel => Intl.message(
        'Ammonia',
        name: 'ammonia',
        args: [],
        locale: locale.toString(),
      );

  String get nitriteLabel => Intl.message(
        'Nitrite',
        name: 'nitrite',
        args: [],
        locale: locale.toString(),
      );

  String get hardnessLabel => Intl.message(
        'Hardness',
        name: 'hardness',
        args: [],
        locale: locale.toString(),
      );

  String get alkalinityLabel => Intl.message(
        'Alkalinity',
        name: 'alkalinity',
        args: [],
        locale: locale.toString(),
      );

  String get calciumLabel => Intl.message(
        'Calcium',
        name: 'calcium',
        args: [],
        locale: locale.toString(),
      );

  String get magnesiumLabel => Intl.message(
        'Magnesium',
        name: 'magnesium',
        args: [],
        locale: locale.toString(),
      );

  String get pondNameLabel => Intl.message(
        'Pond Name',
        name: 'pondNameLabel',
        args: [],
        locale: locale.toString(),
      );

  String get pondNameHint => Intl.message(
        'pond A',
        name: 'pondNameHint',
        args: [],
        locale: locale.toString(),
      );

  String get pondSizeLabel => Intl.message(
        'Pond Size in Acre',
        name: 'pondSizeLabel',
        args: [],
        locale: locale.toString(),
      );

  String get pondSizeHint => Intl.message(
        '2.7',
        name: 'pondSizeHint',
        args: [],
        locale: locale.toString(),
      );

  String get startCulture => Intl.message(
        'Start Culture',
        name: 'startCulture',
        args: [],
        locale: locale.toString(),
      );

  String get stockingDensityLabel => Intl.message(
        'Stocking Density',
        name: 'stockingDensityLabel',
        args: [],
        locale: locale.toString(),
      );

  String get hatcheryNameLabel => Intl.message(
        'Hatchery Name',
        name: 'hatcheryNameLabel',
        args: [],
        locale: locale.toString(),
      );

  String get feedNameLabel => Intl.message(
        'Feed Name',
        name: 'feedNameLabel',
        args: [],
        locale: locale.toString(),
      );

  String get technicianNameLabel => Intl.message(
        'Technician Name',
        name: 'technicianNameLabel',
        args: [],
        locale: locale.toString(),
      );

  String get technicianMobileLabel => Intl.message(
        'Technician Mobile',
        name: 'technicianMobileLabel',
        args: [],
        locale: locale.toString(),
      );

  String get stockingDateLabel => Intl.message(
        'Stocking Date',
        name: 'stockingDateLabel',
        args: [],
        locale: locale.toString(),
      );

  String get newPond => Intl.message(
    'New Pond',
    name: 'newPond',
    args: [],
    locale: locale.toString(),
  );



  String get general => Intl.message(
    'General',
    name: 'general',
    args: [],
    locale: locale.toString(),
  );

  String get stock => Intl.message(
    'Stock',
    name: 'stock',
    args: [],
    locale: locale.toString(),
  );

  String get harvest => Intl.message(
    'Harvest',
    name: 'harvest',
    args: [],
    locale: locale.toString(),
  );

  String get cultureData => Intl.message(
    'Culture Data:',
    name: 'cultureData',
    args: [],
    locale: locale.toString(),
  );

  String get pondActive => Intl.message(
    'Pond Active',
    name: 'pondActive',
    args: [],
    locale: locale.toString(),
  );

  String get doc => Intl.message(
    'D.O.C',
    name: 'doc',
    args: [],
    locale: locale.toString(),
  );

  String get stockDensity => Intl.message(
    'Stock Dencity',
    name: 'stockDensity',
    args: [],
    locale: locale.toString(),
  );

  String get growth => Intl.message(
    'Growth',
    name: 'growth',
    args: [],
    locale: locale.toString(),
  );

  String get feedUsage => Intl.message(
    'Feed Usage',
    name: 'feedUsage',
    args: [],
    locale: locale.toString(),
  );

  String get updatedOn => Intl.message(
    'Updated on',
    name: 'updatedOn',
    args: [],
    locale: locale.toString(),
  );

  String get enterData => Intl.message(
    'Enter Data',
    name: 'enterData',
    args: [],
    locale: locale.toString(),
  );

  String get analytics => Intl.message(
    'Analytics',
    name: 'analytics',
    args: [],
    locale: locale.toString(),
  );

  String get stockingDetails => Intl.message(
    'Stocking Details:',
    name: 'stockingDetails',
    args: [],
    locale: locale.toString(),
  );

  String get density => Intl.message(
    'Density',
    name: 'density',
    args: [],
    locale: locale.toString(),
  );

  String get date => Intl.message(
    'Date',
    name: 'date',
    args: [],
    locale: locale.toString(),
  );


  String get harvestDetails => Intl.message(
    'Harvest Details:',
    name: 'harvestDetails',
    args: [],
    locale: locale.toString(),
  );

  String get output => Intl.message(
    'Output',
    name: 'output',
    args: [],
    locale: locale.toString(),
  );

  String get count => Intl.message(
    'Count',
    name: 'count',
    args: [],
    locale: locale.toString(),
  );

  String get buyer => Intl.message(
    'Buyer',
    name: 'buyer',
    args: [],
    locale: locale.toString(),
  );

  String get sellingPrice => Intl.message(
    'Selling Price',
    name: 'sellingPrice',
    args: [],
    locale: locale.toString(),
  );

  String get enterCultureData => Intl.message(
    'Enter Culture Data:',
    name: 'enterCultureData',
    args: [],
    locale: locale.toString(),
  );

  String get takeAPhoto => Intl.message(
    'Take a photo of the form',
    name: 'takeAPhoto',
    args: [],
    locale: locale.toString(),
  );

  String get waterQualityParams => Intl.message(
    'Water Quality Parameters',
    name: 'waterQualityParams',
    args: [],
    locale: locale.toString(),
  );

  String get feed => Intl.message(
    'Feed',
    name: 'feed',
    args: [],
    locale: locale.toString(),
  );

  String get healthStatus => Intl.message(
    'Health Status',
    name: 'healthStatus',
    args: [],
    locale: locale.toString(),
  );

  String get healthApplications => Intl.message(
    'Health Applications',
    name: 'healthApplications',
    args: [],
    locale: locale.toString(),
  );
  String get waterQuality => Intl.message(
    'Water Quality',
    name: 'waterQuality',
    args: [],
    locale: locale.toString(),
  );

  String get enterWaterQuality => Intl.message(
    'Enter Water Quality:',
    name: 'enterWaterQuality:',
    args: [],
    locale: locale.toString(),
  );

  String get ammonia => Intl.message(
    'Ammonia',
    name: 'ammonia',
    args: [],
    locale: locale.toString(),
  );
  String get nitrate => Intl.message(
    'Nitrate',
    name: 'nitrate',
    args: [],
    locale: locale.toString(),
  );
  String get alkalinity => Intl.message(
    'Alkalinity',
    name: 'alkalinity',
    args: [],
    locale: locale.toString(),
  );
  String get calcium => Intl.message(
    'Calcium',
    name: 'calcium',
    args: [],
    locale: locale.toString(),
  );
  String get magnesium => Intl.message(
    'Magnesium',
    name: 'magnesium',
    args: [],
    locale: locale.toString(),
  );
  String get growthData => Intl.message(
    'Growth Data',
    name: 'growthData',
    args: [],
    locale: locale.toString(),
  );

  String get sampleWeight => Intl.message(
    'Sample Weight',
    name: 'sampleWeight',
    args: [],
    locale: locale.toString(),
  );

  String get avgGmsOrCount => Intl.message(
    'Avg.gms/count',
    name: 'avgGmsOrCount',
    args: [],
    locale: locale.toString(),
  );

  String get healthStatusWithColon => Intl.message(
    'Health status:',
    name: 'healthStatusWithColon',
    args: [],
    locale: locale.toString(),
  );

  String get gill => Intl.message(
    'Gill',
    name: 'gill',
    args: [],
    locale: locale.toString(),
  );

  String get gut => Intl.message(
    'Gut',
    name: 'gut',
    args: [],
    locale: locale.toString(),
  );

  String get body => Intl.message(
    'Body',
    name: 'body',
    args: [],
    locale: locale.toString(),
  );

  String get otherIssues => Intl.message(
    'Other issues',
    name: 'otherIssues',
    args: [],
    locale: locale.toString(),
  );

  String get enterDailyFeedIntake => Intl.message(
    'Enter Daily Feed Intake:',
    name: 'enterDailyFeedIntake',
    args: [],
    locale: locale.toString(),
  );

  String get healthCareApps => Intl.message(
    'Healthcare Apps',
    name: 'healthCareApps',
    args: [],
    locale: locale.toString(),
  );

  String get observation => Intl.message(
    'Observation',
    name: 'observation',
    args: [],
    locale: locale.toString(),
  );

  String get remedy => Intl.message(
    'Remedy',
    name: 'remedy',
    args: [],
    locale: locale.toString(),
  );

}






class FarmMojoLocalizationsDelegate
    extends LocalizationsDelegate<FarmMojoLocalizations> {
  @override
  Future<FarmMojoLocalizations> load(Locale locale) =>
      FarmMojoLocalizations.load(locale);

  @override
  bool shouldReload(FarmMojoLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}
