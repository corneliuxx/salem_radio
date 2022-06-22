import 'dart:convert';

//import 'package:admob_flutter/admob_flutter.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:http/http.dart' as http;

//import 'All_Radio_Station.dart';
import 'status.dart';
import 'Helper/Constant.dart';
import 'Helper/Model.dart';
//import 'SubCategory.dart';
//import 'main.dart';
import 'package:provider/provider.dart';

///category list
List<Model> catList = [];


///current slider position
//int _curSlider = 0;

///slider list
//List<Model> slider_list = [];

///slider image list
//List slider_image = [];

///favorite list size
int favSize = 0;

///is category loading
bool catloading = true;

///is error exist or not
//bool errorExist = false;


///home class
class Home extends StatefulWidget {
  VoidCallback _play, _pause, _next, _previous;

  ///constructor
  Home(
      {VoidCallback play,
      VoidCallback pause,
      VoidCallback next,
      VoidCallback previous})
      : _play = play,
        _pause = pause,
        _next = next,
        _previous = previous;

  _Home_State createState() => _Home_State();
}




class _Home_State extends State<Home> with AutomaticKeepAliveClientMixin<Home> {


  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var bottomPadding = mediaQueryData.padding.bottom;
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.Offline)
      return _offline(bottomPadding);
  return _buildWebView();
  }


  Widget _offline(bottomPadding) {
    return WillPopScope(
        // ignore: missing_return
        onWillPop: () async {        },

      child: Container(
          decoration: BoxDecoration(color: primary),
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Scaffold(

            body: Column(
              children: <Widget>[
                Container(
                  height: 130,
                ),
                Expanded(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(height: 40),
                          Text(
                            "whoops",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "no Internet",
                            style: TextStyle(color: Colors.black87, fontSize: 15.0),
                          ),
                          SizedBox(height: 5),
                          SizedBox(height: 60),
                          GestureDetector(

                            child: Card(
                                child: Text(
                                  "try Again",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),

                                ),

                          ),
                        ])),
                Container(
                  height: 100,
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildWebView() {
  return WebView(
  javascriptMode: JavascriptMode.unrestricted,
  initialUrl: 'https://app.mbeziluislutheran.or.tz/',
  );
  }
  @override
  bool get wantKeepAlive => true;
  }
