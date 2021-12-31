import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<PermissionStatus> _requestContactsPermission() async {
    return await Permission.contacts.request();
  }

  Future<PermissionStatus> _requestLocationPermission() async {
    return await Permission.locationWhenInUse.request();
  }

  requestContactPermissions(Function onPermissionDenied) async {
    final status = await _requestContactsPermission();

    if (!status.isGranted) {
      onPermissionDenied();
    }

    return status;
  }

  hasContactPermission() async {
    return await Permission.contacts.request() == PermissionStatus.granted;
  }
}
