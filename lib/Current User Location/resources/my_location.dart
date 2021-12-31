import 'package:geocoding/geocoding.dart' as GeoCoding;
import 'package:location/location.dart';

class MyLocation {
  late final Location _location;

  MyLocation() {
    _location = Location();
  }

  Location get location => _location;

  Future<LocationData?> getLocation() async {
    bool _serviceEnabled = await _location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();

      if (!_serviceEnabled) throw Exception("Permission Denied");
    }

    PermissionStatus _permissionGranted = await _location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.hasPermission();

      if (_permissionGranted != PermissionStatus.granted) return null;
    }

    final currentPosition = await _location.getLocation();

    return currentPosition;
  }

  Future<GeoCoding.Placemark> _getPlacemarks(
    double latitude,
    double longitude,
  ) async {
    // For getting placemarks Internet should be on
    List<GeoCoding.Placemark> placemarks =
        await GeoCoding.placemarkFromCoordinates(
      latitude,
      longitude,
    );

    return placemarks.first;
  }

  Future<GeoCoding.Placemark?> getAddress() async {
    LocationData? locationData = await getLocation();

    if (locationData != null) {
      return _getPlacemarks(locationData.latitude!, locationData.longitude!);
    }
  }
}
