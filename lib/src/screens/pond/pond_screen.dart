import 'package:FarmMojo/src/screens/pond/reports/feed_report.dart';
import 'package:FarmMojo/src/screens/pond/reports/growth_report.dart';
import 'package:FarmMojo/src/screens/pond/reports/health_status_report.dart';
import 'package:FarmMojo/src/screens/pond/reports/medicine_report.dart';
import 'package:FarmMojo/src/screens/pond/reports/water_quality_report.dart';
import 'package:FarmMojo/src/screens/pond/widgets/add_feed_intake.dart';
import 'package:FarmMojo/src/screens/pond/widgets/add_growth_data.dart';
import 'package:FarmMojo/src/screens/pond/widgets/pond_app_bar.dart';
import 'package:FarmMojo/src/screens/pond/widgets/pond_details.dart';
import 'package:FarmMojo/src/screens/pond/widgets/scroll_menu.dart';
import 'package:FarmMojo/src/screens/widgets/blur_screen.dart';
import 'package:FarmMojo/src/store/actions/pond_actions.dart';
import 'package:FarmMojo/src/store/actions/utility_actions.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/store/states/pond_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;

class PondScreen extends StatefulWidget {
  @override
  _PondScreenState createState() => _PondScreenState();
}

class _PondScreenState extends State<PondScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showBlurScreen = false;

  PersistentBottomSheetController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
/*    showStockDetails() {
      print("Show Stock details...");
      showBlurScreen = true;
      controller = _scaffoldKey.currentState
          .showBottomSheet<Null>((BuildContext context) {
        return StockingDetails();
      });

      controller.closed.then((_) {
        if (showBlurScreen) {
          setState(() {
            showBlurScreen = false;
          });
        }
      });

      setState(() {});
    }

    showHarvestDetails() {}*/

    showBottomScreen(Widget screen) {
      print("Show Stock details...");
      showBlurScreen = true;
      controller = _scaffoldKey.currentState
          .showBottomSheet<Null>((BuildContext context) {
        return screen;
      });

      controller.closed.then((_) {
        if (showBlurScreen) {
          setState(() {
            showBlurScreen = false;
          });
        }
      });

      setState(() {});
    }

    return Scaffold(
        key: _scaffoldKey,
        floatingActionButton: StoreConnector<AppState, PondMenuItems>(
            distinct: true,
            converter: (store) => store.state.pondState.selectedMenuItem,
            builder: (context, selectedMenuItem) {
              return !showBlurScreen &&
                      (selectedMenuItem == PondMenuItems.Feed ||
                          selectedMenuItem == PondMenuItems.Growth)
                  ? FloatingActionButton(
                      tooltip: "Add Feed data",
                      onPressed: () {
                        if (selectedMenuItem == PondMenuItems.Feed) {
                          showBottomScreen(AddFeedIntake());
                          print("Add Pond Feed Data");
                        } else if (selectedMenuItem == PondMenuItems.Growth) {
                          print("Add Pond Growth Data");
                          showBottomScreen(AddGrowthData());
                        }
                      },
                      backgroundColor: theme.floatActionBtnColor,
                      child: Icon(Icons.add),
                    )
                  : Container();
            }),
        body: StoreConnector<AppState, _ViewModel>(
          distinct: true,
          converter: (store) => _ViewModel.create(store, context),
          builder: (context, viewModel) => Stack(
                children: <Widget>[
                  PondAppBar(
                    showBottomScreen: showBottomScreen,
                    goBack: viewModel.goBack,
                  ),
                  Column(children: <Widget>[
                    SizedBox(height: 40),
                    PondDetails(),
                    SizedBox(height: 20),
                    ScrollMenu(
                      menuItems: viewModel.menu,
                      selectedItem: viewModel.selectedMenuItem,
                      changeMenuItem: viewModel.changeMenuItem,
                    ),
                    SizedBox(height: 20),
                    Expanded(
                        child: viewModel.selectedMenuItem ==
                                PondMenuItems.Water_Quality
                            ? WaterQualityReport()
                            : viewModel.selectedMenuItem == PondMenuItems.Feed
                                ? FeedReport()
                                : viewModel.selectedMenuItem ==
                                        PondMenuItems.Growth
                                    ? GrowthReport()
                                    : viewModel.selectedMenuItem ==
                                            PondMenuItems.Health_status
                                        ? HealthStatusReport()
                                        : viewModel.selectedMenuItem ==
                                                PondMenuItems.Medicine
                                            ? MedicineReport()
                                            : Container()),
                  ]),
                  showBlurScreen ? BlurScreen() : Container()
                ],
              ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _ViewModel {
  final PondMenuItems selectedMenuItem;
  final List<PondMenuItems> menu;
  final Function(PondMenuItems) changeMenuItem;
  final Function goBack;

  _ViewModel(
      {this.selectedMenuItem, this.menu, this.changeMenuItem, this.goBack});

  factory _ViewModel.create(Store<AppState> store, BuildContext context) {
    PondMenuItems _selectedMenuItem = store.state.pondState.selectedMenuItem;
    List<PondMenuItems> _menu = store.state.pondState.menu;
    _changeMenuItem(PondMenuItems item) =>
        store.dispatch(PondMenuItemChangedAction(item));
    _goBack() => store.dispatch(GoBackAction(context));

    return _ViewModel(
        selectedMenuItem: _selectedMenuItem,
        menu: _menu,
        changeMenuItem: _changeMenuItem,
        goBack: _goBack);
  }
}
