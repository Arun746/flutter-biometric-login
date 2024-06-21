
 Step1: Go to -> android/app/src/main/kotlin/MainActivity.kt

<!-- ------------------change------------------ -->

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()

<!-- ------------------To----------------------- -->

import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity()


 Step2: Add Permission in  android/app/src/main/AndroidManifest.xml
 <!-- inside <manifest> -->
<manifest -->
<!-- this is permission -->
  <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
</manifest>

 Step 3: add local_auth package on pubspec.yaml