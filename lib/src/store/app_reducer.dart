import 'package:FarmMojo/src/store/app_state.dart';
import 'package:FarmMojo/src/store/reducers/auth_reducer.dart';
import 'package:FarmMojo/src/store/reducers/login_reducer.dart';
import 'package:FarmMojo/src/store/reducers/pond_reducer.dart';

AppState appReducer(AppState state, action) => AppState(
      authState: authReducer(state.authState, action),
      loginState: loginReducer(state.loginState, action),
      pondState: pondReducer(state.pondState, action),
    );
