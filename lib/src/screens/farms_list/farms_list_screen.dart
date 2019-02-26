import 'package:FarmMojo/src/screens/farm/farm_screen.dart';
import 'package:FarmMojo/src/store/actions/utility_actions.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/utils/theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FarmsListScreen extends StatefulWidget {
  FarmsListScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FarmsListScreenState createState() => new _FarmsListScreenState();
}

const kExpandedHeight = 180.0;

class _FarmsListScreenState extends State<FarmsListScreen> {
  ScrollController _scrollController;

  String name = 'Hello! Raja', area = 'ECR Chennai';
  int totalFarms = 5, totalPonds = 106;

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
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: StoreConnector<AppState, _ViewModel>(
          distinct: true,
          converter: (store) => _ViewModel.create(store, context),
          builder: (context, viewModel) =>
              CustomScrollView(controller: _scrollController, slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  leading: IconButton(
                    icon: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/farmer_image.png"),
                    ),
                    // CircleAvatar(backgroundImage: AssetImage("assets/images/farmer_image.png")
                    onPressed: () {},
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search),
                      tooltip: 'Search Farms !',
                      onPressed: () {},
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
                                '$area',
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
                                    "Total Farms",
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
                                    child: FittedBox(
                                      child: Text("$totalFarms",
                                          style: theme.normalTextStyle.copyWith(
                                              color: theme.primaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600)),
                                    ),
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
                                    padding: EdgeInsets.all(1.0),
                                    width: 15,
                                    height: 15,
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: Colors.white),
                                    child: FittedBox(
                                      child: Text("$totalPonds",
                                          style: theme.normalTextStyle.copyWith(
                                              color: theme.primaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                      List<Padding>.generate(10, (int i) {
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
                          onTap: () {
                            viewModel.gotoFarm();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                    color: theme.backgroundColor,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.warning,
                                          color: theme.errorColor),
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                            '"3 ponds" in critical conditions ',
                                            softWrap: true,
                                            style: theme.normalTextStyle
                                                .copyWith(
                                                    color: theme.errorColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 1.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "GKS farms",
                                              style: theme.titleTextStyle
                                                  .copyWith(
                                                      color: theme.textColor,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Old Mahabalipuram Road, chennai",
                                              style: theme.titleTextStyle
                                                  .copyWith(
                                                      color: theme.textColor,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "Shrimp Available - ",
                                                  style: theme.titleTextStyle
                                                      .copyWith(
                                                          color:
                                                              theme.textColor,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: "2,346 ton",
                                                      style: theme
                                                          .titleTextStyle
                                                          .copyWith(
                                                              color: theme
                                                                  .textColor,
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ]),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "Total Ponds - ",
                                                  style: theme.titleTextStyle
                                                      .copyWith(
                                                          color:
                                                              theme.textColor,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: "12",
                                                      style: theme
                                                          .titleTextStyle
                                                          .copyWith(
                                                              color: theme
                                                                  .textColor,
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    TextSpan(
                                                      text: " Active Ponds - ",
                                                      style: theme
                                                          .titleTextStyle
                                                          .copyWith(
                                                              color: theme
                                                                  .textColor,
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    TextSpan(
                                                      text: "9",
                                                      style: theme
                                                          .titleTextStyle
                                                          .copyWith(
                                                              color: theme
                                                                  .textColor,
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ]),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text("GSKK-MAS"),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: theme.primaryColor,
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                        ],
                                      ),
                                    ],
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
              ])),
    );
  }
}

class _ViewModel {
  final Function gotoFarm;

  _ViewModel({this.gotoFarm});

  factory _ViewModel.create(Store<AppState> store, BuildContext context) {
    _gotoFarm() => store.dispatch(GotoNextScreenAction(context, FarmScreen()));

    return _ViewModel(gotoFarm: _gotoFarm);
  }
}
