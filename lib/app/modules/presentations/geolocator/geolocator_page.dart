import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorPage extends StatefulWidget {
  const GeolocatorPage({super.key});

  @override
  State<GeolocatorPage> createState() => _GeolocatorPageState();
}

class _GeolocatorPageState extends State<GeolocatorPage> {
  late StreamSubscription<Position> positionStream;

  //localização do perímetro setada para teste
  final double targetLatitude = -22.14917;
  final double targetLongitude = -51.39261;

  //raio desejado para o perímetro em metros
  final double targetRadius = 50.0;

  //view
  String view = '';

  //verifica se o app está autorizado a localizar e retorna a localização
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Serviço de localização desabilitado');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Serviço de localização proibido');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Serviço de localização sempre proibido');
    }

    return await Geolocator.getCurrentPosition();

    //or
    /*
    try {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle denied permission
      debugPrint('permissão negada');
    } else if (permission == LocationPermission.deniedForever) {
      // Handle denied forever permission
      debugPrint('permissão negada para sempre');
    } else {
      // Permission granted, you can now start tracking location.
      debugPrint('permissão negada');
    }
  } catch (e) {
    // Handle permission request failure.
    debugPrint('permissão negada');
  }
    */
  }

  @override
  void initState() {
    super.initState();

    //verifica as permissões
    _determinePosition();

    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 50,
    );

    //escuta-se a stream
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      //print(position == null
      //    ? 'Unknown'
      //    : '${position.latitude.toString()}, ${position.longitude.toString()}');

      if (position != null) {
        debugPrint(
            "Location updated: ${position.latitude}, ${position.longitude}");

        //obtém a distância do perímetro estabelecido
        double distance = calculateDistance(
          position.latitude,
          position.longitude,
          targetLatitude,
          targetLongitude,
        );

        //confirma se a localização corrente está dentro do raio determinado
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
    positionStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocator'),
      ),
      body: Center(
        child: Text('Tracking: $view'),
      ),
    );
  }
}
