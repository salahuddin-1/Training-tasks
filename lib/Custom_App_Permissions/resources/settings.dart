// Android
// In the AndroidManifest add the uses-permission tags for the two features.
// <uses-permission android:name="android.permission.READ_CONTACTS" />
//     <uses-permission android:name="android.permission.WRITE_CONTACTS" />
//     <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// iOS
// In the info.plist file add the keys along with your message
// <key>NSContactsUsageDescription</key>
// 	<string>This app requires contacts access to function.</string>
// 	<key>NSLocationWhenInUseUsageDescription</key>
// 	<string>This app requires access to your location when in use to show relevan information.</string>
// 	<key>NSLocationAlwaysUsageDescription</key>
// 	<string>This app requires always on access to to your location to notifiy you when are near a store.</string>