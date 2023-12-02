import 'package:json_annotation/json_annotation.dart';

part 'weather_modal.g.dart';
@JsonSerializable()
class Weather {
  final String cityName;
  final double temprature;
  final String condition;

  Weather(
      {required this.cityName,
      required this.temprature,
      required this.condition});
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
