import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

// Also Add Permission in Android.manifest
// Add Native code in kotlin folder
// For IOS face id add in Runner info.plist
// <key>NSFaceIDUsageDescription</key>
// <string>Authenticate by using face id</string>

class LocalAuthAPI {
  static final _auth = new LocalAuthentication();

  static Future<bool> authenticate() async {
    // FIRST CHECK if Device has BioMetrics
    // final isAvailable = await hasBiometrics();
    // Checks if device supports bio metrics or not

    // if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
        localizedReason: 'Scan Fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      if (e.code == 'NotAvailable') {
        // If any security is not available
        print('Go and set a password first');
      }
      return false;
    }
  }

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
