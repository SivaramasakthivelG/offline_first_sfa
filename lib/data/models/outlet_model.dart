import 'package:equatable/equatable.dart';
import 'package:offline_outlet/data/local/database.dart';

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

  OutletsCompanion toCompanion() {
    return OutletsCompanion.insert(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      updatedAt: updatedAt,
      version: version,
    );
  }

  factory OutletModel.fromDatabase(Outlet outlet) {
    return OutletModel(
      id: outlet.id,
      name: outlet.name,
      latitude: outlet.latitude,
      longitude: outlet.longitude,
      updatedAt: outlet.updatedAt,
      version: outlet.version,
    );
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