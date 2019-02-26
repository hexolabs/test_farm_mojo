class GeneralInfo {
  final num doc;
  final num density;
  final String species;
  final dynamic growth;
  final dynamic feedUsage;
  final DateTime growthUpdatedOn;
  final DateTime wqtUpdatedOn;

  GeneralInfo(
      {this.doc,
      this.density,
      this.species,
      this.growth,
      this.feedUsage,
      this.growthUpdatedOn,
      this.wqtUpdatedOn});

  GeneralInfo copyWith({int doc, int density, String species, int growth,
      int feedUsage, DateTime growthUpdatedOn, DateTime wqtUpdatedOn}) {
    return GeneralInfo(
        doc: doc ?? this.doc,
        density: density ?? this.density,
        species: species ?? this.species,
        growth: growth ?? this.growth,
        feedUsage: feedUsage ?? this.feedUsage,
        growthUpdatedOn: growthUpdatedOn ?? this.growthUpdatedOn,
        wqtUpdatedOn: wqtUpdatedOn ?? this.wqtUpdatedOn);
  }

  static GeneralInfo fromJson(dynamic json) {
    return GeneralInfo(
      doc: json['doc'],
      density: json['stocking_density'],
      species: json['species'],
      growth: json['growth'],
      feedUsage: json['feed_usage'],
      growthUpdatedOn: json['growth_updated_on'] != null ? DateTime.fromMillisecondsSinceEpoch(json['growth_updated_on']) : null,
      wqtUpdatedOn: json['water_quality_updated_on'] != null ? DateTime.fromMillisecondsSinceEpoch(json['growth_updated_on']) : null,
    );
  }

  @override
  String toString() =>
      'GeneralInfo($doc, $density, $species, $growth, $feedUsage, $growthUpdatedOn, $wqtUpdatedOn)';
}

class Stocking {
  final String id;
  final String pondId;
  final int density;
  final DateTime date;
  final int pl;
  final String hatchery;
  final String species;
  final num seedCost;

  Stocking(
      {this.id,
      this.pondId,
      this.density,
      this.date,
      this.pl,
      this.hatchery,
      this.species,
      this.seedCost});

  Stocking copyWith({String id, String pondId, int density, DateTime date,
      int pl, String hatchery, String species, int seedCost}) {
    return Stocking(
        id: id ?? this.id,
        pondId: pondId ?? this.pondId,
        density: density ?? this.density,
        date: date ?? this.date,
        pl: pl ?? this.pl,
        hatchery: hatchery ?? this.hatchery,
        species: species ?? this.species,
        seedCost: seedCost ?? this.seedCost);
  }

  static Stocking fromJson(dynamic json) {
    return Stocking(
      id: json['stocking_id'],
      density: json['stocking_density'],
      date: DateTime.fromMillisecondsSinceEpoch(json['stocking_date']),
      pl: json['pl'],
      hatchery: json['hatchery'],
      species: json['species'],
      seedCost: json['seed_cost'],
    );
  }

  toJsonAddStocking() => {
        "pond_id": pondId,
        "stocking_density": density,
        "stocking_date": date.millisecondsSinceEpoch,
        "pl": pl,
        "hatchery": hatchery,
        "species": species,
        "seed_cost": seedCost
      };

  toJsonUpdateStocking() => {
    "stocking_id": id,
    "stocking_density": density,
    "stocking_date": date.millisecondsSinceEpoch,
    "pl": pl,
    "hatchery": hatchery,
    "species": species,
    "seed_cost": seedCost
  };

  @override
  String toString() =>
      'Stocking($id, $density, $date, $pl, $hatchery, $species, $seedCost)';
}

class StockDetails {
  final GeneralInfo general;
  final Stocking stocking;

  StockDetails({this.general, this.stocking});

  static StockDetails fromJson(dynamic json) {
    return StockDetails(
        general: GeneralInfo.fromJson(json['general']),
        stocking: Stocking.fromJson(json['stocking']));
  }

  @override
  String toString() => 'StockDetails($general, $stocking)';
}
