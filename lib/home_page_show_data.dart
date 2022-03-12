import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/filter_data.dart';

import 'Model/markerMap.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // TODO: implement initState
    intilize();
    super.initState();
  }

  intilize() {
    _listMarkerMap
        .add(new MakerMap("test1", 10.8104894, 106.7201971, "Sai Gon River"));
    _listMarkerMap
        .add(new MakerMap("test2", 10.8006386, 106.7201951, "Sai Gon 1 River"));
    _listMarkerMap
        .add(new MakerMap("test3", 10.823832, 106.7201931, "Sai Gon 2 River"));
    _listMarkerMap
        .add(new MakerMap("test4", 10.8339432, 106.7201911, "Sai Gon 3 River"));

    _listMarker.addAll(_listMarkerMap.map((e) {
      return Marker(
          markerId: MarkerId(e.marKerID),
          position: LatLng(e.vt1, e.vt2),
          infoWindow: InfoWindow(title: e.infoWindown),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet));
    }));
  }

  double zoomVal = 5.0;
  String _nameAppBar = "Hồ Chí Minh";

  List<MakerMap> _listMarkerMap = [];
  List<Marker> _listMarker = [];
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(isVisible ? Icons.close : FontAwesomeIcons.arrowLeft),
              onPressed: () {
                setState(() {
                  _nameAppBar = 'Hồ Chí Minh';
                  isVisible = !isVisible;
                });
              },
            ),
          ],
        ),
        centerTitle: true,
        title: Text("$_nameAppBar"),
        actions: <Widget>[
          Visibility(
              visible: !isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: IconButton(
                  onPressed: () {
                    // showSearch(context: context, delegate: CustomSearchDelegate());
                    setState(() {
                      _nameAppBar = 'Tìm kiếm';
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.search)))
        ],
      ),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
          _filterData(),
          _showSeachBar(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _showSeachBar() {
    return Visibility(
        visible: isVisible,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              color: Colors.black45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 90,
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: SizedBox(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                              hintText: 'Tìm kiếm theo tên nơi cư trú',
                            ),
                          ),
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Tìm kiếm',
                              style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlueAccent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  Widget _filterData() {
    return Visibility(
        visible: !isVisible,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: Align(
            alignment: Alignment.topRight,
            child: Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _onButtonFilter();
                      },
                      child: Row(
                        children: [Icon(Icons.add_road), Text("Bộ lọc")],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [Icon(Icons.list), Text("Danh sách")],
                      ),
                    ),
                  ],
                ))));
  }

  Widget _buildList() {
    return Align(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        height: MediaQuery.of(context).size.height,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: _listMarkerMap
                .map((e) => Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: _boxes(
                                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                                e.vt1,
                                e.vt2,
                                e.infoWindown))
                      ],
                    ))
                .toList()),
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        height: 150.0,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: _listMarkerMap
                .map((e) => Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: _boxes(
                                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                                e.vt1,
                                e.vt2,
                                e.infoWindown))
                      ],
                    ))
                .toList()),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        _getLocation(lat, long);
      },
      child: Container(
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(5.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 115,
                  child: ClipRRect(
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  width: 215,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainers(restaurantName),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainers(String restaurantName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            restaurantName,
            style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "7.804.734đ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "/đêm",
                  style: TextStyle(color: Colors.black26),
                ),
              )
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(bottom: 5.0)),
        Container(
          width: 185,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightBlue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
            onPressed: () {},
            child: const Text("Xem chi tiết"),
          ),
        )
      ],
    );
  }

  Widget _googleMap(BuildContext buildContext) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(10.8004386, 106.7222471), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _listMarker.map((e) => e).toSet(),
      ),
    );
  }

  void _onButtonFilter() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (_) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: ListDataBottom(),
          );
        });
  }

  Future<void> _getLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, long), zoom: 15, tilt: 50.0, bearing: 45.0)));
  }
}
