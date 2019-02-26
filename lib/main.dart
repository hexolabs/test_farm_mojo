import 'package:FarmMojo/src/localization.dart';
import 'package:FarmMojo/src/screens/farms_list/farms_list_screen.dart';
import 'package:FarmMojo/src/screens/login/login_screen.dart';
import 'package:FarmMojo/src/screens/splash/splash_screen.dart';
import 'package:FarmMojo/src/store/actions/auth_actions.dart';
import 'package:FarmMojo/src/store/app_middleware.dart';
import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/store/states/auth_state.dart';
import 'package:FarmMojo/src/utils/routes.dart';
import 'package:FarmMojo/src/utils/theme.dart' as MojoTheme;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:FarmMojo/src/store/app_reducer.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(MojoApp());
}

class MojoApp extends StatefulWidget {
  @override
  _MojoAppState createState() => _MojoAppState();
}

class _MojoAppState extends State<MojoApp> {

  final Store<AppState> _store = Store<AppState>(appReducer,
      distinct: true,
      initialState: AppState.initial(),
      middleware: []
        ..addAll(appMiddleware())
        ..addAll([LoggingMiddleware.printer()]));

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
      store: _store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "FARM MOJO",
          initialRoute: FarmMojoRoutes.init,
          localizationsDelegates: [FarmMojoLocalizationsDelegate()],
          theme: ThemeData(
              primaryColor: MojoTheme.primaryColor,
              appBarTheme: AppBarTheme(
                  elevation: 0.0,
                  brightness: Brightness.dark,
                  textTheme: TextTheme(title: MojoTheme.normalTextStyle))),
          home: StoreConnector<AppState, _ViewModel>(
            distinct: true,
            onInit: (store) => store.dispatch(AuthCheckAction()),
            converter: (store) => _ViewModel.create(store),
            builder: (context, viewModel) {
              return viewModel.userState == UserState.login
                  ? LoginScreen() : viewModel.userState == UserState.home ? FarmsListScreen()
                  : FarmsListScreen();
            },
          ),
        ),
      );
}

class _ViewModel {
  final UserState userState;

  _ViewModel({this.userState});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(userState: store.state.authState.state);
  }
}
