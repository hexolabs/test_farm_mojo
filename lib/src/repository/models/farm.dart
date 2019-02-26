import 'package:FarmMojo/src/repository/models/address.dart';
import 'package:FarmMojo/src/repository/models/location.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Farm {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(name: 'farm_code', nullable: false)
  final String farmCode;
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(name: "block_exist", nullable: false)
  final String isBlockExists;
  final Location location;
  final Address address;
  @JsonKey(name: "total_ponds", nullable: false)
  final int totalPonds;
  @JsonKey(name: "active_ponds", nullable: false)
  final int activePonds;
  @JsonKey(name: "critical_ponds", nullable: false)
  final int criticalPonds;
  @JsonKey(name: "warning_ponds", nullable: false)
  final int warningPonds;
  @JsonKey(name: "shrimp_available", nullable: false)
  final double availableShrimp;

  Farm(
      {this.id,
      this.farmCode,
      this.name,
      this.isBlockExists,
      this.location,
      this.address,
      this.totalPonds,
      this.activePonds,
      this.criticalPonds,
      this.warningPonds,
      this.availableShrimp});
}
