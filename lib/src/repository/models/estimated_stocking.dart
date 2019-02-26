class EstimatedStocking {
  final String id;
  final String farmId;
  final int noOfPonds;
  final int density;
  final DateTime date;
  final String species;
  final int salinity;

  EstimatedStocking(
      {this.id,
      this.farmId,
      this.noOfPonds,
      this.density,
      this.date,
      this.species,
      this.salinity});

  EstimatedStocking copyWith(
      {String id,
      String farmId,
      int noOfPonds,
      int density,
      DateTime date,
      String species,
      int salinity}) {
    return EstimatedStocking(
        id: id ?? this.id,
        farmId: farmId ?? this.farmId,
        noOfPonds: noOfPonds ?? this.noOfPonds,
        density: density ?? this.density,
        date: date ?? this.date,
        species: species ?? this.species,
        salinity: salinity ?? this.salinity);
  }

  static EstimatedStocking fromJson(dynamic json) {
    return EstimatedStocking(
        id: json['estimated_stocking_id'],
        farmId: json['farm_id'],
        noOfPonds: json['no_of_ponds'],
        density: json['estimated_stocking_density'],
        date: DateTime.fromMillisecondsSinceEpoch(
            json['estimated_stocking_date']),
        species: json['species'],
        salinity: json['salinity']);
  }

  toJsonAddEst() => {
        "farm_id": farmId,
        "no_of_ponds": noOfPonds,
        "estimated_stocking_density": density,
        "estimated_stocking_date": date.millisecondsSinceEpoch,
        "species": species,
        "salinity": salinity
      };

  toJsonUpdateEst() => {
       "estimated_stocking_id": id,
        "no_of_ponds": noOfPonds,
        "estimated_stocking_density": density,
        "estimated_stocking_date": date.millisecondsSinceEpoch,
        "species": species,
        "salinity": salinity
      };

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is EstimatedStocking &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          noOfPonds == other.noOfPonds &&
          density == other.density &&
          date == other.date &&
          species == other.species &&
          salinity == other.salinity;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      noOfPonds.hashCode ^
      density.hashCode ^
      date.hashCode ^
      species.hashCode ^
      salinity.hashCode;

  @override
  String toString() =>
      'EstimatedStocking {farmId: $farmId, id: $id, noOfPonds: $noOfPonds, density: $density, date: $date, species: $species, salinity: $salinity}';
}
