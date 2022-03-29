// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Wc _$WcFromJson(Map<String, dynamic> json) => Wc(
      address: json['address'] as String,
      id: json['id'] as String,
      workingTime: json['workingTime'] as String,
      image: json['image'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      price: json['price'] as String,
      region: json['region'] as String,
    );

Map<String, dynamic> _$WcToJson(Wc instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'workingTime': instance.workingTime,
      'image': instance.image,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'price': instance.price,
      'region': instance.region,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      wc: (json['wc'] as List<dynamic>)
          .map((e) => Wc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'wc': instance.wc,
    };