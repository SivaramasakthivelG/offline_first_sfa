import 'package:offline_outlet/data/models/outlet_model.dart';

class OutletMockApi {
  Future<List<OutletModel>> fetchOutlets() async {
    //throw Exception("No Internet");
    await Future.delayed(const Duration(seconds: 1));

    final response = [
      {
        "id": "o-101",
        "name": "Sri Balaji Stores",
        "lat": 9.9252,
        "lng": 78.1198,
        "updatedAt": "2026-07-10T09:12:00Z",
        "version": 3,
      },
      {
        "id": "o-102",
        "name": "Anbu Super Market",
        "lat": 9.9270,
        "lng": 78.1221,
        "updatedAt": "2026-07-10T09:15:00Z",
        "version": 1,
      },
      {
        "id": "o-103",
        "name": "Lakshmi Stores",
        "lat": 9.9294,
        "lng": 78.1185,
        "updatedAt": "2026-07-09T16:20:00Z",
        "version": 2,
      },
      {
        "id": "o-104",
        "name": "ABC Medicals",
        "lat": 9.9312,
        "lng": 78.1208,
        "updatedAt": "2026-07-08T11:30:00Z",
        "version": 5,
      },
      {
        "id": "o-105",
        "name": "Kumar Mart",
        "lat": 9.9235,
        "lng": 78.1174,
        "updatedAt": "2026-07-11T08:45:00Z",
        "version": 1,
      },
    ];

    return response
        .map((json) => OutletModel.fromJson(json))
        .toList();
  }
}