import 'package:FarmMojo/src/store/actions/pond_actions.dart';
import 'package:FarmMojo/src/store/states/pond_state.dart';
import 'package:redux/redux.dart';

final pondReducer = combineReducers<PondState>([
  TypedReducer<PondState, PondMenuItemChangedAction>(_menuItemChanged),
]);

PondState _menuItemChanged(PondState state, PondMenuItemChangedAction action) {
  return state.copyWith(selectedMenuItem: action.selectedMenuItem);
}