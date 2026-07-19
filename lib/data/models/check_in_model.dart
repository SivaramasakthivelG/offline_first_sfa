import 'package:equatable/equatable.dart';

class CheckInModel extends Equatable {
  final double latitude;
  final double longitude;
  final double accuracy;

  const CheckInModel({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
  });

  factory CheckInModel.fromJson(Map<String, dynamic> json) {
    return CheckInModel(
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['lng'] as num).toDouble(),
      accuracy: (json['accuracy'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': latitude,
      'lng': longitude,
      'accuracy': accuracy,
    };
  }

  @override
  List<Object> get props => [
    latitude,
    longitude,
    accuracy,
  ];
}