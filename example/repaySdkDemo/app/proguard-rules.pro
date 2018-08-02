# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#okio
-dontwarn okio.**
#android
-dontwarn android.net.**
-keep class android.net.SSLCertificateSocketFactory{*;}
#sdk
-keep class me.andpay.**{*;}
#zmxy
-keep class com.alipayzhima.**{*;}
-keep class com.android.moblie.zmxy.antgroup.creditsdk.**{*;}
-keep class com.antgroup.zmxy.mobile.android.container.**{*;}
-keep class com.megvii.livenessdetection.**{*;}
-keep class org.json.alipayzhima.**{*;}
#alipay
-keep class com.alipay.android.app.IAlixPay{*;}
-keep class com.alipay.android.app.IAlixPay$Stub{*;}
-keep class com.alipay.android.app.IRemoteServiceCallback{*;}
-keep class com.alipay.android.app.IRemoteServiceCallback$Stub{*;}
-keep class com.alipay.sdk.app.PayTask{ public *;}
-keep class com.alipay.sdk.app.AuthTask{ public *;}