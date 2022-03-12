import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/provider/location_provider.dart';
import 'package:provider/provider.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initalization();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Maps"),
          backgroundColor: Colors.redAccent,
        ),
        body: googleMapUI());
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(
      builder: (consummerContext, model, child) {
        if (model.localtionPosition != null) {
          return Column(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(10.8004386, 106.7222471), zoom: 18),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controler) {},
                ),
              )
            ],
          );
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
