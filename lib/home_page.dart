import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as location;

import 'src/locations.dart' as locations;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Map<String, Marker> _markers = {};
  //Location _location = Location();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  static const LatLng _kMapCenter = LatLng(49.988358, 36.232845);
  // ignore: prefer_const_declarations
  static final CameraPosition _kInitialPosition = const CameraPosition(
      target: _kMapCenter, zoom: 15.5, tilt: 65, bearing: 0);
  late final GoogleMapController mapController;
  //final Geolocator _geolocator = Geolocator();
  // For storing the current position
  late Position _currentPosition;
  PageController _pageController = PageController(viewportFraction: 0.9);
  late MarkerId previousMarker;

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {});
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    final googleWc = await locations.getGoogleWc();
    setState(() {
      _markers.clear();
      for (final wc in googleWc.wc) {
        final marker = Marker(
          //consumeTapEvents: true,
          markerId: MarkerId(wc.id),
          position: LatLng(wc.lat, wc.lng),
          infoWindow: InfoWindow(
            title: wc.name,
            snippet: wc.address,
          ),
        );
        _markers[wc.id] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: _kInitialPosition,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.hybrid,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,

          // initialCameraPosition: const CameraPosition(
          //   target: LatLng(49.988358, 36.232845),
          //   zoom: 11.0,
          // ),
          markers: _markers.values.toSet(),
        ),
        ClipOval(
          child: Material(
            color: Colors.orange[100], // button color
            child: InkWell(
              splashColor: Colors.orange, // inkwell color
              child: const SizedBox(
                width: 56,
                height: 56,
                child: Icon(Icons.my_location),
              ),
              onTap: () {
                getLocation();
                final markerCurrent = Marker(
                    markerId: const MarkerId("User"),
                    position: LatLng(
                        _currentPosition.latitude, _currentPosition.longitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),);
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(
                        _currentPosition.latitude,
                        _currentPosition.longitude,
                      ),
                      zoom: 15.5,
                      tilt: 65,
                      bearing: 0,
                      
                    ),
                    
                  ),
                 
                );
                
              },
            ),
          ),
        ),
      ]),
    );
  }
}
