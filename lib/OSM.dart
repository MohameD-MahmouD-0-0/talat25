import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:latlong2/latlong.dart';

class OSMHOME extends StatefulWidget {
  @override
  State<OSMHOME> createState() => _OSMHOMEState();
}

class _OSMHOMEState extends State<OSMHOME> {
  String locationaddress = 'Pick location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Open Street Map')),
      body: Center(
        child: Container(
          child: InkWell(
            child: Text(locationaddress),
            onTap: () {
              ShowModal(context);
            },
          ),
        ),
      ),
    );
  }

  void ShowModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: OpenStreetMapSearchAndPick(
            // center: LatLong(23, 89),
            buttonColor: Colors.blue,
            buttonText: 'Set Current Location',
            onPicked: (pickedData) {
              Navigator.pop(context);
              setState(() {
                locationaddress = pickedData.address as String;
              });
            },
          ),
        );
      },
    );
  }
}
