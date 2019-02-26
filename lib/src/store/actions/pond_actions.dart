import 'package:FarmMojo/src/store/states/pond_state.dart';

class PondMenuItemChangedAction {
  final PondMenuItems selectedMenuItem;
  const PondMenuItemChangedAction(this.selectedMenuItem);

  @override
  String toString() =>
      "PondMenuItemChangedAction { selectedMenuItem: $selectedMenuItem}";
}
