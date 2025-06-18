# Keep all classes in a specific package
-keep class goid.metrokota.pns { *; }

-keep public class * extends android.app.Activity
-keep public class * extends androidx.appcompat.app.AppCompatActivity
-keep public class * extends androidx.fragment.app

-keep class com.google.android.gms.** { *; }
-keep class com.google.android.play.core.** { *; }

#-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
#-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep annotations (useful for libraries that use reflection)
-keep class io.flutter.** { *; }
-keep class androidx.lifecycle.** { *; }
-keep class com.google.firebase.** { *; }
-keep class android.support.v4.** { *; }

-dontwarn io.flutter.embedding.**
-dontwarn io.flutter.plugin.**

# Keep sentry
-keep class com.aheaditec.freerasp.** { *; }
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

-dontwarn com.aheaditec.freerasp.**

# Keep safe device
-keep class com.xamdesign.safe_device.** { *; }

-dontwarn com.xamdesign.safe_device.**

# Keep all serializable classes
-keep class * implements java.io.Serializable { *; }

# Keep dynamically loaded classes (common in Play Core updates)
-keep class com.google.android.play.** { *; }
-keep class com.google.android.play.core.splitcompat.** { *; }