import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:neosoft_training_tasks/Current%20User%20Location/resources/my_location.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';
import 'package:neosoft_training_tasks/src/widgets/circular_progress.dart';

class CurrentUserLocationScreen extends StatefulWidget {
  CurrentUserLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentUserLocationScreenState createState() =>
      _CurrentUserLocationScreenState();
}

class _CurrentUserLocationScreenState extends State<CurrentUserLocationScreen> {
  late final MyLocation _myLocation;

  Placemark? _placeMark;

  @override
  void initState() {
    super.initState();
    _myLocation = MyLocation();

    _myLocation.location.onLocationChanged.listen(
      (event) {
        print(event.altitude);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, 'Current User Location'),
      body: FutureBuilder<Placemark?>(
          future: _myLocation.getAddress(),
          builder: (context, snapshot) {
            if (_placeMark == null) {
              _placeMark = snapshot.data;
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return Center(
                child: Text(_placeMark.toString()),
              );
            }
            return circularProgressText();
          }),
    );
  }

  // String getAddress() {
  //   return
  // }
}
