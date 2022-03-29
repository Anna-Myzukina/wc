import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'WC - Туалеты Харькова',
      home: const HomePage(title: 'WC - Туалеты Харькова на карте'),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'src/locations.dart' as locations;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Maps',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MapView(),
//     );
//   }
// }

// class MapView extends StatefulWidget {
//   const MapView({Key? key}) : super(key: key);

//   @override
//   _MapViewState createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   static final LatLng _kMapCenter = LatLng(49.988358, 36.232845);
//   // Initial location of the Map view
// static final  CameraPosition _initialLocation = CameraPosition(target: _kMapCenter, zoom: 15.5, tilt: 65, bearing: 0);
//   final Map<String, Marker> _markers = {};
// // For controlling the view of the Map
//   late final GoogleMapController mapController;
//   //final Geolocator _geolocator = Geolocator();
//  // For storing the current position
//   late Position _currentPosition;

//   _getCurrentLocation() async {
//      LocationPermission permission;
//    permission = await Geolocator.requestPermission();
//  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//        .then((Position position) async {
//     setState(() {
//      // Store the position in the variable
//       _currentPosition = position;
//       print('CURRENT POS: $_currentPosition');
//        // For moving the camera to current location
//      mapController.animateCamera(
//        CameraUpdate.newCameraPosition(
//           CameraPosition(
//           target: LatLng(position.latitude, position.longitude),
//           zoom: 18.0,
//          ),
//          ),
//        );
//   });
//   }).catchError((e) {
//     print(e);
//   });
// }

// @override
//  void initState() {
//    super.initState();
//   _getCurrentLocation();
//  }

//  Future<void> _onMapCreated(GoogleMapController controller) async {
//     mapController = controller;
//     // String value = await DefaultAssetBundle.of(context)
//     //     .loadString('assets/map_style.json');
//     // _controller.setMapStyle(value);
//     final googleWc = await locations.getGoogleWc();
//     setState(() {
//       _markers.clear();
//       for (final wc in googleWc.wc) {
//         final marker = Marker(
//           //consumeTapEvents: true,
//           markerId: MarkerId(wc.id),
//           position: LatLng(wc.lat, wc.lng),
//           infoWindow: InfoWindow(
//             title: wc.name,
//             snippet: wc.address,
//           ),
//         );
//         _markers[wc.id] = marker;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Determining the screen width & height
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     return Container(
//       height: height,
//       width: width,
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             GoogleMap(
//               initialCameraPosition: _initialLocation,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//               mapType: MapType.hybrid,
//               zoomGesturesEnabled: true,
//               zoomControlsEnabled: true,
//               onMapCreated: _onMapCreated,
//                markers: _markers.values.toSet(),
//             ),
//             ClipOval(
//               child: Material(
//                 color: Colors.orange[100], // button color
//                 child: InkWell(
//                   splashColor: Colors.orange, // inkwell color
//                   child: const SizedBox(
//                     width: 56,
//                     height: 56,
//                     child: Icon(Icons.my_location),
//                   ),
//                   onTap: () {
//                     mapController.animateCamera(
//   CameraUpdate.newCameraPosition(
//     CameraPosition(
//       target: LatLng(
//         // Will be fetching in the next step
//         _currentPosition.latitude,
//         _currentPosition.longitude,
//       ),
//       zoom: 18.0,
//     ),
//   ),
// );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
