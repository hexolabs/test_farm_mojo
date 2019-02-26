import 'package:meta/meta.dart';

@immutable
class Pond {
  final int id;
  final String pondId;
  final String farmId;
  final String name;
  final num pondArea;
  final bool isActive;

  Pond({this.id, this.pondId, this.farmId, this.name, this.pondArea, this.isActive});

  Pond copyWith(
      {int id, String pondId, String name, String farmId, double pondArea, bool isActive}) {
    return Pond(
        id: id ?? this.id,
        pondId: pondId ?? this.pondId,
        name: name ?? this.name,
        farmId: farmId ?? this.farmId,
        pondArea: pondArea ?? this.pondArea,
        isActive: isActive ?? this.isActive);
  }

  static Pond fromJson(dynamic obj) {
    return Pond(
        id: obj["id"],
        pondId: obj['pond_id'],
        name: obj["pond_name"],
        pondArea: obj['pond_area'].toDouble(),
        isActive: obj['active']);
  }

  toJsonForCreatePond() {
    return {"farm_id": farmId, "name": name, "pond_area": pondArea};
  }


  @override
  String toString() {
    return 'Pond{pondId: $pondId, id: $id, pondArea: $pondArea, active: $isActive}';
  }
}
