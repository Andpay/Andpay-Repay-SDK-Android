## 和付帮还安卓sdk接入文档

### 一、快速集成
#### 导入sdk
1、gradle导入方式
a、在项目中的build.gradle中添加jcenter远程仓库

```
buildscript {
    repositories {
        jcenter()
    }
}
allprojects {
    repositories {
        jcenter()
    }
}
```
b、在module中的build.gradle中添加sdk远程依赖

```
dependencies{
	compile 'me.andpay.ma.sdk:repay:1.0.0@aar'
}
```

2、maven导入方式
```
<dependency>
  <groupId>me.andpay.ma.sdk</groupId>
  <artifactId>repay</artifactId>
  <version>1.0.0</version>
  <type>pom</type>
</dependency>
```

3、下载sdk导入
将下载的repay-1.0.0.aar拷贝到module的libs目录，并在module的build.gradle中填下如下配置：

```
repositories{
    flatDir{
    	dirs 'libs'
    }
}
dependencies{
	compile(name:'repay-1.0.0',ext:'aar')
}
```
#### 第三方库导入
1、由于需要用到第三方库，请在module中的build.gradle中添加如下远程依赖

```
dependencies{
	compile 'com.squareup.okhttp:okhttp:2.3.0'
	compile 'com.squareup.okio:okio:1.3.0'
	compile 'org.jsoup:jsoup:1.8.3'
}
```

2、芝麻信用sdk接入

a：由于用到芝麻信用授权，所以也要接入芝麻信用sdk，将下载的zmxy-1.0.1.jar拷贝到module的libs目录，并在module的build.gradle中填下如下配置(注：如果已接入芝麻信用，请忽略这步)：

```
repositories{
    flatDir{
    	dirs 'libs'
    }
}
dependencies{
	compile(name:'zmxy-1.0.1.jar',ext:'jar')
}
```
b：在module的application中加入如下配置

```
<activity
    android:name="com.android.moblie.zmxy.antgroup.creditsdk.app.SDKActivity"
    android:label="zmxy"
    android:screenOrientation="portrait"/>

```

3、支付宝支付sdk接入

a：由于用到支付宝支付，所以也要接入支付宝支付sdk，将下载的alipaysdk.jar拷贝到module的libs目录，并在module的build.gradle中填下如下配置(注：如果已接入支付宝宝支付，请忽略这步)：

```
repositories{
    flatDir{
    	dirs 'libs'
    }
}
dependencies{
	compile(name:'alipaysdk.jar',ext:'jar')
}
```
b：在module的application中加入如下配置

```
<activity
    android:name="com.alipay.sdk.app.H5PayActivity"
    android:configChanges="orientation|keyboardHidden|navigation"
    android:exported="false"
    android:screenOrientation="behind">
</activity>
<activity
    android:name="com.alipay.sdk.auth.AuthActivity"
    android:configChanges="orientation|keyboardHidden|navigation"
    android:exported="false"
    android:screenOrientation="behind">

```

#### sdk权限要求
所有权限均已在sdk中声明，sdk已经适配了6.0的动态权限申请，接入方无需为权限申请添加额外代码（请知晓：启动sdk时不会强制获取权限，但是在帮还过程中，为确保帮还成功和安全，可能会强制获取部分权限，权限获取失败可能导致流程无法进行）

##### 1、通用权限
```
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
<uses-permission android:name="android.permission.READ_CONTACTS"/>
<uses-permission android:name="android.permission.READ_CALL_LOG" />
```
##### 2、定位权限

```
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```
##### 3、读写权限

```
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

### 二、发起帮还
#### 初始化sdk
在使用sdk前需要对sdk进行初始化配置，初始化配置只需要进行一次,建议放在Activity onCreate方法中

```
RepaySdkManager.init(RepayConfig config)
```
#### 启动sdk
其中params主要是启动sdk的参数配置，可以包含以下参数：

partyId：商户号（必选）

mobileNo：用户手机号（必选）

token：用户授权token（必选）


env：环境参数（可选stage1-测试环境，pro-生产环境，默认为生产环境）

```
RepaySdkManager.startRepayModule(Activity activity,Map<String,Object> params);
```


### 注意事项
#### 环境切换
实例app中有stage1、pro两个环境可供测试，每次切换环境前，请先重启app(杀掉app重新打开)，进入app后点击相关环境按钮，即可切换到相应的环境


#### 混淆配置ProGuard
如果需要进行混淆(ProGuard)配置，请将以下配置加入混淆规则中：
```
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
```

#### 日志
初始化sdk时，debug参数默认为false，将debug模式打开后，sdk将输出更加详细的日志





