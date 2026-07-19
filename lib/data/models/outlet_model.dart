import 'package:equatable/equatable.dart';

class OutletModel extends Equatable {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final DateTime updatedAt;
  final int version;

  const OutletModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
    required this.version,
  });

  factory OutletModel.fromJson(Map<String, dynamic> json) {
    return OutletModel(
      id: json['id'],
      name: json['name'],
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['lng'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lat': latitude,
      'lng': longitude,
      'updatedAt': updatedAt.toIso8601String(),
      'version': version,
    };
  }

  @override
  List<Object> get props => [
    id,
    name,
    latitude,
    longitude,
    updatedAt,
    version,
  ];
}