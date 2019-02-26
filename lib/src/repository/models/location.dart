
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Location{
  final double latitude;
  final double longitude;

  const Location({this.latitude, this.longitude});

}