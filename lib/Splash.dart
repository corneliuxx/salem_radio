import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'Helper/Constant.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

///splash screen of app
class Splash extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<Splash> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  }

  @override
  void initState() {
    super.initState();
    initOneSignal();

    getcityMode();

    startTime();
  }


  Future<void> initOneSignal() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(true);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      this.setState(() {});
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {});
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      this.setState(() {});
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {});

    OneSignal.shared
        .setPermissionObserver((OSPermissionStateChanges changes) {});

    OneSignal.shared.setEmailSubscriptionObserver(
            (OSEmailSubscriptionStateChanges changes) {});

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.init(
        'ca26c291-d0c4-4e3b-bc50-e7707986c8e7',
        iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    OneSignal.shared.consentGranted(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/back.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/image/logo.png',
                width: 250,
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getcityMode() async {
    var data = {'access_key': '6808'};
    var response = await http.post(city_mode, body: data);

    print("responce****city mode**${response.body.toString()}");

    var getdata = json.decode(response.body);

    var error = getdata['error'].toString();
    if (!mounted) return null;

    if (error == 'false') {
      var city = getdata['data'];

      if (city == "1") {
        cityMode = true;
      } else {
        cityMode = false;
      }

    } else {
      cityMode = false;
    }
  }
}
