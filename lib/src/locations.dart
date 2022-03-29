import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'locations.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    required this.lat,
    required this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}


@JsonSerializable()
class Wc {
  var geometry;

  Wc({
    required this.address,
    required this.id,
    required this.workingTime,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.price,
    required this.region,
  });

  factory Wc.fromJson(Map<String, dynamic> json) => _$WcFromJson(json);
  Map<String, dynamic> toJson() => _$WcToJson(this);

  final String address;
  final String id;
  final String workingTime;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String price;
  final String region;
}

@JsonSerializable()
class Locations {
  Locations({
    required this.wc,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Wc> wc;
}

Future<Locations> getGoogleWc() async {
  const googleLocationsURL =
      'https://github.com/appverse-ru/radar-weather/blob/main/locations.json';

  try {
    final response = await http.get(Uri.parse(googleLocationsURL));
    if (response.statusCode == 200) {
      return Locations.fromJson(json.decode(response.body));
    }
  } catch (e) {
    //print(e);
  }

  // Fallback for when the above HTTP request fails.
  return Locations.fromJson(
    json.decode(
      await rootBundle.loadString('assets/locations.json'),
    ),
  );
}
