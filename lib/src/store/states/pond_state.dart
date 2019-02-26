import 'package:meta/meta.dart';

enum PondMenuItems {
  All_Activities,
  Water_Quality,
  Feed,
  Growth,
  Health_status,
  Medicine
}

@immutable
class PondState {
  final PondMenuItems selectedMenuItem;
  final List<PondMenuItems> menu = List.unmodifiable([
    PondMenuItems.All_Activities,
    PondMenuItems.Water_Quality,
    PondMenuItems.Feed,
    PondMenuItems.Growth,
    PondMenuItems.Health_status,
    PondMenuItems.Medicine
  ]);

  PondState({this.selectedMenuItem});

  factory PondState.initial() =>
      PondState(selectedMenuItem: PondMenuItems.Water_Quality);

  PondState copyWith({PondMenuItems selectedMenuItem}) =>
      PondState(selectedMenuItem: selectedMenuItem ?? this.selectedMenuItem);

  @override
  bool operator ==(other) =>
      identical(other, this) ||
      other is PondState &&
          runtimeType == other.runtimeType &&
          selectedMenuItem == other.selectedMenuItem;

  @override
  int get hashCode => super.hashCode ^ selectedMenuItem.hashCode;

  @override
  String toString() => 'PondState { selectedMenuItem: $selectedMenuItem}';
}
