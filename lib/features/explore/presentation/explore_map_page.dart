import 'dart:collection';
import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreMapPage extends StatefulWidget {
  @override
  _ExploreMapPageState createState() => _ExploreMapPageState();
}

class _ExploreMapPageState extends State<ExploreMapPage> {
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      _markers.add(Marker(markerId: MarkerId("0"),
      position: const LatLng(38.702326, -9.240135),
        infoWindow: InfoWindow(title: "Our House", snippet: "The place where me and Sara live!")
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final _bottomNavBloc = context.watch<BottomNavigationBarBloc>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Map', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              _bottomNavBloc.add(BottomNavigationExplorePagePressed());
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(38.702326, -9.240135),
          zoom: 15.0,
        ),
        markers: _markers,
      ),
    );
  }
}
