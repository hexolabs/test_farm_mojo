import 'package:FarmMojo/src/screens/farm/widgets/estimated_stocking.dart';
import 'package:FarmMojo/src/screens/pond/pond_screen.dart';
import 'package:FarmMojo/src/screens/widgets/blur_screen.dart';
import 'package:FarmMojo/src/store/actions/utility_actions.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FarmScreen extends StatefulWidget {
  FarmScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FarmScreenState createState() => new _FarmScreenState();
}

const kExpandedHeight = 180.0;

class _FarmScreenState extends State<FarmScreen> {
  ScrollController _scrollController;

  String name = 'Nila Shrimp Farms', id = 'NSFP-MAC';
  int activePonds = 7, totalPonds = 10;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showBlurScreen = false;

  PersistentBottomSheetController controller;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _showTitle {
    return _scrollController.hasClients && _scrollController.offset > 75;
  }

  @override
  Widget build(BuildContext context) {
    showBottomScreen(Widget screen) {
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
      backgroundColor: theme.backgroundColor,
      body: StoreConnector<AppState, _ViewModel>(
          distinct: true,
          builder: (context, viewModel) =>
              Stack(children: <Widget>[
                CustomScrollView(controller: _scrollController, slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      tooltip: 'Search Farms',
                      onPressed: viewModel.goBack,
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        tooltip: 'Search Farms',
                        onPressed: () {},
                      ),
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert),
                        onSelected: (value) {
                          showBottomScreen(EstimatedStockingWidget());
                        },
                        padding: EdgeInsets.all(0.0),
                        itemBuilder: (context) => <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: "Hello",
                            child: Container(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.topCenter,
                                child: Center(
                                    child: Text(
                                      'Estimated Stocking',
                                      style: theme.normalTextStyle,
                                    ))),
                          ),
                        ],
                      ),
                    ],
                    expandedHeight: kExpandedHeight,
                    titleSpacing: 0.0,
                    centerTitle: true,
                    title: _showTitle
                        ? Text(name,
                        style: theme.titleTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600))
                        : null,
                    flexibleSpace: _showTitle
                        ? null
                        : FlexibleSpaceBar(
                      centerTitle: true,
                      title: new Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            name,
                            style: theme.titleTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'FARM ID: $id',
                            style: theme.normalTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Active Ponds",
                                style: theme.normalTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 15,
                                height: 15,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Colors.white),
                                child: Text("$activePonds",
                                    style: theme.normalTextStyle.copyWith(
                                        color: theme.primaryColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Total Ponds",
                                style: theme.normalTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 15,
                                height: 15,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Colors.white),
                                child: Text("$totalPonds",
                                    style: theme.normalTextStyle.copyWith(
                                        color: theme.primaryColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                        List<Padding>.generate(5, (int i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25, bottom: 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              //shape: CircleBorder(side: BorderSide(width: 16.0, color: Colors.lightBlue.shade50)),
                              elevation: 4.0,
                              child: InkWell(
                                onTap: viewModel.gotoPondScreen,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.error,
                                                color: theme.errorColor),
                                            Text("Pond $i",
                                                style: theme.normalTextStyle.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w500)),
                                            Spacer(),
/*                            PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert),
                                onSelected: (value) {
                                  print(value);
                                },
                                padding: EdgeInsets.all(0.0),
                                itemBuilder: (context) => <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                        value: "Stock Details",
                                        child: Container(
                                            padding: EdgeInsets.zero,
                                            alignment: Alignment.topCenter,
                                            child: Center(
                                                child: Text(
                                              'Stock Details',
                                              style: theme.normalTextStyle,
                                            ))),
                                      ),
                                      PopupMenuItem<String>(
                                        value: "Harvest Details",
                                        child: Container(
                                            padding: EdgeInsets.zero,
                                            alignment: Alignment.topCenter,
                                            child: Center(
                                                child: Text(
                                              'Harvest Details',
                                              style: theme.normalTextStyle,
                                            ))),
                                      ),
                                    ],
                              ),*/
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Container(
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  text: "45",
                                                  style: theme.normalTextStyle
                                                      .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.w500),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: "\nDOC",
                                                        style: theme.subTitleTextStyle
                                                            .copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.w400))
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
                                                      style: theme.subTitleTextStyle
                                                          .copyWith(
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
                                                      style: theme.subTitleTextStyle
                                                          .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w400))
                                                ]),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 1.0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0)),
                                            color: theme.backgroundColor),
                                        child: Text(
                                          "Ammonia is high & other 2 parameters are in critical condition",
                                          style: theme.normalTextStyle.copyWith(
                                              color: theme.errorColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                ]),
                showBlurScreen ? BlurScreen() : Container()
              ],),
          converter: (store) => _ViewModel.create(store, context)),
    );
  }
}

class _ViewModel {
  final Function goBack;
  final Function gotoPondScreen;

  _ViewModel({this.goBack, this.gotoPondScreen});

  factory _ViewModel.create(Store<AppState> store, BuildContext context) {
    _gotoPond() => store.dispatch(GotoNextScreenAction(context, PondScreen()));
    _goBack() => store.dispatch(GoBackAction(context));
    return _ViewModel(goBack: _goBack, gotoPondScreen: _gotoPond);
  }
}
