import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Address {
  @JsonKey(nullable: true)
  final String locality;
  @JsonKey(name: "active_ponds", nullable: true)
  final String area;
  @JsonKey(name: "critical_ponds", nullable: true)
  final String city;
  @JsonKey(name: "warning_ponds", nullable: true)
  final String district;
  @JsonKey(name: "shrimp_available", nullable: true)
  final String state;
  final String pinCode;

  Address(
      {this.locality,
      this.area,
      this.city,
      this.district,
      this.state,
      this.pinCode});
}
