import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LocalMapsPage extends StatefulWidget {
  const LocalMapsPage({super.key});

  @override
  State<LocalMapsPage> createState() => _LocalMapsPageState();
}

class _LocalMapsPageState extends State<LocalMapsPage> {
  Location location = Location();

  //localização inicial
  LocationData? currentLocation;

  //localização do perímetro setada para teste
  final double targetLatitude = -22.14917;
  final double targetLongitude = -51.39261;

  //raio desejado para o perímetro em metros
  final double targetRadius = 50.0;

  //stream to dispose after using
  late StreamSubscription<LocationData> locationSubscription;

  //view
  String view = '';

  @override
  void initState() {
    super.initState();

    //Autoriza a localicação quando em background
    location.enableBackgroundMode(enable: true);

    //escuta-se a stream
    locationSubscription =
        location.onLocationChanged.listen((LocationData newLocation) {
      //troca a localização para a nova após mudar
      currentLocation = newLocation;

      debugPrint(
          "Location updated: ${newLocation.latitude}, ${newLocation.longitude}");

      //confirma se a localização corrente está dentro do raio determinado
      if (currentLocation != null) {
        double distance = calculateDistance(
          currentLocation!.latitude!,
          currentLocation!.longitude!,
          targetLatitude,
          targetLongitude,
        );

        if (distance <= targetRadius) {
          debugPrint("Inside the target radius!");
          setState(() {
            view = 'Inside';
          });
        } else {
          debugPrint("Outside the target radius");
          setState(() {
            view = 'Outside';
          });
        }
      }
    });
  }

  //cálculo do perímetro
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000.0;

    double dLat = (lat2 - lat1) * (pi / 180.0);
    double dLon = (lon2 - lon1) * (pi / 180.0);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * (pi / 180.0)) *
            cos(lat2 * (pi / 180.0)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  @override
  void dispose() {
    super.dispose();
    locationSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Example'),
      ),
      body: Center(
        child: Text('Tracking: $view'),
      ),
    );
  }
}
