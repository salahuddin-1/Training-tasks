
// For IOS

// in info.plist

// <key>NSLocationAlwaysUsageDescription</key>
// 	<string>Needed to access location</string>
// 	<key>NSLocationWhenInUseUsageDescription</key>
// 	<string>Needed to access location</string>


// For Android

// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />


// in build.gradle
// minSdkVersion > 16
// compileSdkversion 30